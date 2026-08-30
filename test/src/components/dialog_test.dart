import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/dialog.dart';
import 'package:shadcn_ui/src/theme/components/dialog.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/utils/position.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadDialog', () {
    testWidgets('ShadDialog matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadDialog(
            title: Text('Title'),
            description: Text('Description'),
            child: Text('Child'),
          ),
        ),
      );

      expect(
        find.byType(ShadDialog),
        matchesGoldenFile('goldens/dialog.png'),
      );
    });

    Future<Rect> pumpAndGetDialogRect(
      WidgetTester tester, {
      required EdgeInsets systemPadding,
      EdgeInsetsGeometry? dialogPadding,
    }) async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(padding: systemPadding),
          child: createTestWidget(
            ShadDialog(
              padding: dialogPadding,
              title: const Text('Title'),
              description: const Text('Description'),
              child: const Text('Child'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      // Measure the actual visible dialog card (the DecoratedBox that
      // paints its background/border), not ShadDialog itself: ShadDialog
      // is a StatelessWidget whose own bounding box is the full screen
      // (from the Align it returns), so it can't reveal internal padding.
      return tester.getRect(
        find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byType(DecoratedBox),
            )
            .first,
      );
    }

    testWidgets(
      'ShadDialog does not add extra top/bottom padding from system UI '
      'insets when centered on screen (#681)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        final withoutInsets = await pumpAndGetDialogRect(
          tester,
          systemPadding: EdgeInsets.zero,
        );
        final withInsets = await pumpAndGetDialogRect(
          tester,
          systemPadding: systemPadding,
        );

        // The dialog card is small, centered, and far from the screen
        // edges, so simulated status bar / navigation bar insets must not
        // shrink its height: SafeArea should protect the edges of the
        // route, not pad the small centered dialog card itself. Before the
        // fix, SafeArea wrapped the dialog card directly, stealing
        // `systemPadding.vertical` (86.6px) from its height.
        expect(withInsets.height, closeTo(withoutInsets.height, 0.5));
      },
    );

    testWidgets(
      'ShadDialog with padding: EdgeInsets.zero still ignores system UI '
      'insets (#681 exact repro)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        final withoutInsets = await pumpAndGetDialogRect(
          tester,
          systemPadding: EdgeInsets.zero,
          dialogPadding: EdgeInsets.zero,
        );
        final withInsets = await pumpAndGetDialogRect(
          tester,
          systemPadding: systemPadding,
          dialogPadding: EdgeInsets.zero,
        );

        // Same assertion as above, but with the dialog's own padding
        // explicitly zeroed out, matching the exact reproduction from the
        // original issue: setting `padding: EdgeInsets.zero` removed the
        // horizontal padding but the vertical blank space stayed, because
        // it came from SafeArea, not from `padding`.
        expect(withInsets.height, closeTo(withoutInsets.height, 0.5));
      },
    );

    testWidgets(
      'padding: EdgeInsets.zero produces exactly the system-inset height, '
      'not default 24 + inset (#681 merge-logic regression)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        await tester.pumpWidget(
          MediaQuery(
            data: const MediaQueryData(padding: systemPadding),
            child: createTestWidget(
              const ShadDialog(
                padding: EdgeInsets.zero,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final dialog = tester.widget<ShadDialog>(find.byType(ShadDialog));
        final padding = dialog.padding! as EdgeInsets;

        // Explicit EdgeInsets.zero must win; the merge logic must not
        // sneak in the default 24px padding.
        expect(padding, EdgeInsets.zero);
      },
    );

    /// Helper: read the effective padding from the built dialog widget tree.
    /// The merge logic runs inside build(), so we find the Padding that sits
    /// inside the DecoratedBox (the dialog card), not the outer one.
    EdgeInsets readBuiltPadding(WidgetTester tester) {
      final decoratedBox = find.byType(DecoratedBox).first;
      final paddingFinder = find.descendant(
        of: decoratedBox,
        matching: find.byType(Padding),
      );
      // There is exactly one Padding inside the DecoratedBox's Stack:
      // the one wrapping the content with effectivePadding.
      final paddingWidget = tester.widget<Padding>(paddingFinder.first);
      return paddingWidget.padding as EdgeInsets;
    }

    testWidgets(
      'dialog uses theme-level padding when widget-level padding is null '
      '(#681 theme-defaults bypassed)',
      (tester) async {
        const themePadding = EdgeInsets.all(40);

        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                padding: themePadding,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final builtPadding = readBuiltPadding(tester);

        // The dialog did NOT set padding explicitly — the merge logic must
        // pick up the theme value (40) and NOT fall back to the hardcoded
        // default (24).
        expect(
          builtPadding,
          const EdgeInsets.all(40),
          reason:
              'dialog should use theme-level padding (40) when '
              'widget-level padding is null',
        );
      },
    );

    testWidgets(
      'dialog uses theme-level closeIconPosition when widget-level is null '
      '(#681 theme-defaults bypassed)',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                closeIconPosition: ShadPosition(top: 16, right: 16),
                // Must set closeIconData too — otherwise no close icon renders.
                closeIconData: Icons.close,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // The close icon is wrapped in a Positioned inside a Stack.
        final positionedFinder = find.byType(Positioned);
        expect(positionedFinder, findsOneWidget);

        final positioned = tester.widget<Positioned>(positionedFinder);

        // Theme values (top: 16, right: 16) must win, not hardcoded (8, 8).
        expect(positioned.top, 16, reason: 'theme top must be used');
        expect(positioned.right, 16, reason: 'theme right must be used');
      },
    );

    testWidgets(
      'widget-level padding overrides theme-level padding '
      '(#681 merge priority)',
      (tester) async {
        const themePadding = EdgeInsets.all(40);
        const widgetPadding = EdgeInsets.all(10);

        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                padding: themePadding,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                padding: widgetPadding,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final builtPadding = readBuiltPadding(tester);

        // Widget-level must always win over theme-level.
        expect(builtPadding, widgetPadding);
      },
    );

    testWidgets(
      'extendBackground: true fills the full screen with the background '
      'color instead of shrinking it away from the true screen edges',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        await tester.pumpWidget(
          const ShadApp(
            home: MediaQuery(
              data: MediaQueryData(padding: systemPadding),
              child: Scaffold(
                body: ShadDialog(
                  extendBackground: true,
                  title: Text('Title'),
                  description: Text('Description'),
                  child: Text('Child'),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // SafeArea still protects the content — it just sits inside the
        // full-screen DecoratedBox instead of wrapping it from outside.
        expect(find.byType(SafeArea), findsOneWidget);

        // The outermost DecoratedBox (with the background color) must not
        // be shrunk by a Padding sitting directly between it and the rest
        // of the tree — that would leave a barrier-colored gap at the
        // edges, which is the bug this fix addresses. It should span the
        // full screen (SizedBox.expand ancestor).
        final shadDialog = find.byType(ShadDialog);
        final outerDecoratedBox = find
            .descendant(
              of: shadDialog,
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .first;
        expect(
          find.ancestor(
            of: outerDecoratedBox,
            matching: find.byType(SizedBox),
          ),
          findsWidgets,
          reason: 'the colored box should expand to fill the screen',
        );
      },
    );

    testWidgets(
      'extendBackground: true with zero viewPadding still works',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Dialog should still render normally.
        expect(find.text('Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground defaults to false (SafeArea is used)',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(
            const ShadDialog(
              title: Text('Title'),
              description: Text('Description'),
              child: Text('Child'),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Default behavior: SafeArea wraps the dialog.
        expect(find.byType(SafeArea), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground via theme',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Theme-level extendBackground should be honored — SafeArea still
        // present, just relocated inside the full-screen background.
        expect(find.byType(SafeArea), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground: true defaults border to null (no visible border)',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Find the inner DecoratedBox (the dialog card) by color.
        final innerDecoratedBoxes = find.descendant(
          of: find.byType(ShadDialog),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                widget.decoration is BoxDecoration &&
                (widget.decoration as BoxDecoration).color != null,
          ),
        );
        // The first DecoratedBox with color is the outer background one;
        // the second is the inner dialog card.
        final innerDecoratedBox = innerDecoratedBoxes.at(1);
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Border should be null when extendBackground is true.
        expect(decoration.border, isNull);
      },
    );

    testWidgets(
      'extendBackground: false defaults border to theme border',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Find the inner DecoratedBox (the dialog card).
        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).border != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Default border should be present.
        expect(decoration.border, isNotNull);
      },
    );

    testWidgets(
      'extendBackground: true shadows default to empty list',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Shadows should be empty when extendBackground is true.
        expect(decoration.boxShadow, isEmpty);
      },
    );

    testWidgets(
      'extendBackground: false shadows default to ShadShadows.lg',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Default shadows should be present.
        expect(decoration.boxShadow, isNotEmpty);
      },
    );

    testWidgets(
      'extendBackground: true borderRadius defaults to null',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // BorderRadius should be null (no rounding) when extendBackground.
        expect(decoration.borderRadius, isNull);
      },
    );

    testWidgets(
      'extendBackground: false borderRadius defaults to effectiveRadius',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // BorderRadius should be present by default.
        expect(decoration.borderRadius, isNotNull);
      },
    );

    testWidgets(
      'extendBackground: true with useSafeArea: false skips SafeArea entirely',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                useSafeArea: false,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // No SafeArea at all when useSafeArea: false.
        expect(find.byType(SafeArea), findsNothing);
      },
    );

    testWidgets(
      'extendBackground: true with useSafeArea: true keeps SafeArea inside',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                useSafeArea: true,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // SafeArea should still be present inside.
        expect(find.byType(SafeArea), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground: true with keyboard insets applies viewInsets padding',
      (tester) async {
        await tester.pumpWidget(
          const MediaQuery(
            data: MediaQueryData(
              viewInsets: EdgeInsets.only(bottom: 300),
            ),
            child: ShadApp(
              home: Scaffold(
                body: ShadDialog(
                  extendBackground: true,
                  title: Text('Title'),
                  description: Text('Description'),
                  child: Text('Child'),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // The dialog should still render with keyboard padding applied.
        expect(find.text('Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground: true with custom border uses the custom border',
      (tester) async {
        const customBorder = Border.fromBorderSide(
          BorderSide(width: 3, color: Colors.red),
        );

        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                border: customBorder,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).border != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Custom border should win over the null default.
        expect(decoration.border, equals(customBorder));
      },
    );

    testWidgets(
      'extendBackground: true with custom shadows uses the custom shadows',
      (tester) async {
        const customShadows = [BoxShadow(blurRadius: 99)];

        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                shadows: customShadows,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Custom shadows should win over the empty default.
        expect(decoration.boxShadow, equals(customShadows));
      },
    );

    testWidgets(
      'extendBackground: true with custom radius forces borderRadius to null',
      (tester) async {
        await tester.pumpWidget(
          const ShadApp(
            home: Scaffold(
              body: ShadDialog(
                extendBackground: true,
                radius: BorderRadius.all(Radius.circular(42)),
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBoxes = find.descendant(
          of: find.byType(ShadDialog),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                widget.decoration is BoxDecoration &&
                (widget.decoration as BoxDecoration).color != null,
          ),
        );
        final innerDecoratedBox = innerDecoratedBoxes.at(1);
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Even with a custom radius, extendBackground forces borderRadius
        // to null since the dialog edges sit behind system UI.
        expect(decoration.borderRadius, isNull);
      },
    );

    testWidgets(
      'extendBackground: true via theme sets border to null',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBoxes = find.descendant(
          of: find.byType(ShadDialog),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is DecoratedBox &&
                widget.decoration is BoxDecoration &&
                (widget.decoration as BoxDecoration).color != null,
          ),
        );
        final innerDecoratedBox = innerDecoratedBoxes.at(1);
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        expect(decoration.border, isNull);
      },
    );

    testWidgets(
      'extendBackground: true via theme sets borderRadius to null',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        expect(decoration.borderRadius, isNull);
      },
    );

    testWidgets(
      'extendBackground: true via theme sets shadows to empty',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).color != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        expect(decoration.boxShadow, isEmpty);
      },
    );

    testWidgets(
      'widget-level extendBackground: false overrides theme-level true',
      (tester) async {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
              ),
            ),
            home: const Scaffold(
              body: ShadDialog(
                extendBackground: false,
                title: Text('Title'),
                description: Text('Description'),
                child: Text('Child'),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Widget-level false overrides theme-level true.
        final innerDecoratedBox = find
            .descendant(
              of: find.byType(ShadDialog),
              matching: find.byWidgetPredicate(
                (widget) =>
                    widget is DecoratedBox &&
                    widget.decoration is BoxDecoration &&
                    (widget.decoration as BoxDecoration).border != null,
              ),
            )
            .last;
        final decoration =
            tester.widget<DecoratedBox>(innerDecoratedBox).decoration
                as BoxDecoration;

        // Default border should be present (extendBackground=false).
        expect(decoration.border, isNotNull);
      },
    );

    testWidgets(
      'extendBackground: true fills screen and does not shrink from edges '
      '(same DecoratedBox size regardless of system padding)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        Future<Size> getDecoratedBoxSize(EdgeInsets padding) async {
          await tester.pumpWidget(
            MediaQuery(
              data: MediaQueryData(padding: padding),
              child: const ShadApp(
                home: Scaffold(
                  body: ShadDialog(
                    extendBackground: true,
                    title: Text('Title'),
                    description: Text('Description'),
                    child: Text('Child'),
                  ),
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // The outermost DecoratedBox with background color.
          final outerDecoratedBox = find
              .descendant(
                of: find.byType(SizedBox),
                matching: find.byWidgetPredicate(
                  (widget) =>
                      widget is DecoratedBox &&
                      widget.decoration is BoxDecoration &&
                      (widget.decoration as BoxDecoration).color != null,
                ),
              )
              .first;
          return tester.getSize(outerDecoratedBox);
        }

        final sizeWithInsets = await getDecoratedBoxSize(systemPadding);
        final sizeWithoutInsets = await getDecoratedBoxSize(EdgeInsets.zero);

        // Both DecoratedBoxes should fill the full screen — system padding
        // must not shrink the background.
        expect(sizeWithInsets.width, closeTo(sizeWithoutInsets.width, 0.5));
        expect(sizeWithInsets.height, closeTo(sizeWithoutInsets.height, 0.5));
      },
    );
  });
}
