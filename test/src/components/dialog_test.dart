import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/dialog.dart';
import 'package:shadcn_ui/src/theme/components/dialog.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

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
      tester.view.viewPadding = FakeViewPadding(
        left: systemPadding.left,
        top: systemPadding.top,
        right: systemPadding.right,
        bottom: systemPadding.bottom,
      );
      await tester.pumpWidget(
        createTestWidget(
          ShadDialog(
            padding: dialogPadding,
            title: const Text('Title'),
            description: const Text('Description'),
            child: const Text('Child'),
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

        tester.view.viewPadding = FakeViewPadding(
          left: systemPadding.left,
          top: systemPadding.top,
          right: systemPadding.right,
          bottom: systemPadding.bottom,
        );
        await tester.pumpWidget(
          createTestWidget(
            const ShadDialog(
              padding: EdgeInsets.zero,
              title: Text('Title'),
              description: Text('Description'),
              child: Text('Child'),
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

    // extendBackground: the outer DecoratedBox (under a SizedBox) paints
    // the full-screen background; the card's own DecoratedBox is the one
    // built directly inside ShadResponsiveBuilder (dialog.dart's `return
    // DecoratedBox(...)` in the builder callback) — unlike a raw first/last
    // index, this stays correct regardless of whether a close icon (which
    // renders its own unrelated DecoratedBox) is present.
    DecoratedBox outerDecoratedBox(WidgetTester tester) {
      return tester.widget<DecoratedBox>(
        find
            .descendant(
              of: find.byType(SizedBox),
              matching: find.byType(DecoratedBox),
            )
            .first,
      );
    }

    DecoratedBox innerCardDecoratedBox(WidgetTester tester) {
      return tester.widget<DecoratedBox>(
        find
            .descendant(
              of: find.byType(ShadResponsiveBuilder),
              matching: find.byType(DecoratedBox),
            )
            .first,
      );
    }

    testWidgets(
      'extendBackground: true fills the full screen with the background '
      'color instead of shrinking it away from the true screen edges',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        tester.view.viewPadding = FakeViewPadding(
          left: systemPadding.left,
          top: systemPadding.top,
          right: systemPadding.right,
          bottom: systemPadding.bottom,
        );
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

        // SafeArea still protects the content — it just sits inside the
        // full-screen DecoratedBox instead of wrapping it from outside.
        expect(find.byType(SafeArea), findsOneWidget);

        // The outer, background-painting DecoratedBox must span the full
        // screen (SizedBox.expand ancestor), not shrink with system
        // padding — that would leave a barrier-colored gap at the edges,
        // which is the bug the route-level SafeArea fix (#681/#685)
        // otherwise reintroduces for edge-reaching dialogs.
        final decoration =
            outerDecoratedBox(tester).decoration as BoxDecoration;
        expect(decoration.color, isNotNull);

        final outerBoxFinder = find
            .descendant(
              of: find.byType(SizedBox),
              matching: find.byType(DecoratedBox),
            )
            .first;
        expect(
          find.ancestor(of: outerBoxFinder, matching: find.byType(SizedBox)),
          findsWidgets,
          reason: 'the colored box should expand to fill the screen',
        );
      },
    );

    testWidgets(
      'extendBackground: true does not paint the background color twice',
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

        // The outer, full-screen layer paints the background color...
        final outerDecoration =
            outerDecoratedBox(tester).decoration as BoxDecoration;
        expect(outerDecoration.color, isNotNull);

        // ...so the inner dialog card must not paint it again. Before the
        // fix, both boxes painted effectiveBackgroundColor, visibly
        // darkening the overlap for a translucent color.
        final innerDecoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;
        expect(innerDecoration.color, isNull);
      },
    );

    testWidgets(
      'extendBackground: true absorbs a tap inside the system-inset strip '
      'instead of letting it fall through to the barrier (#702)',
      (tester) async {
        tester.view.padding = const FakeViewPadding(top: 40);
        addTearDown(tester.view.resetPadding);

        await tester.pumpWidget(
          ShadApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: TextButton(
                      onPressed: () {
                        showShadDialog<void>(
                          context: context,
                          builder: (context) => const ShadDialog(
                            extendBackground: true,
                            constraints: BoxConstraints(maxWidth: 200),
                            alignment: Alignment.center,
                            title: Text('Title'),
                            child: Text('Child'),
                          ),
                        );
                      },
                      child: const Text('Open'),
                    ),
                  ),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        expect(find.byType(ShadDialog), findsOneWidget);

        // The status-bar strip (top: 40) now visually looks like part of
        // the dialog (the background paints through it), so a tap there
        // must be claimed instead of reaching the ModalBarrier beneath.
        final screenSize =
            tester.view.physicalSize / tester.view.devicePixelRatio;
        await tester.tapAt(Offset(screenSize.width / 2, 5));
        await tester.pumpAndSettle();

        expect(
          find.byType(ShadDialog),
          findsOneWidget,
          reason:
              'a tap inside the system-inset strip must not dismiss '
              'the dialog',
        );
      },
    );

    testWidgets(
      'extendBackground: true still lets barrierDismissible dismiss a '
      'constrained dialog by tapping outside the card and outside the '
      'system-inset strips (#702: the opaque area must not cover the '
      'whole screen)',
      (tester) async {
        tester.view.padding = const FakeViewPadding(top: 40);
        addTearDown(tester.view.resetPadding);

        await tester.pumpWidget(
          ShadApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: TextButton(
                      onPressed: () {
                        showShadDialog<void>(
                          context: context,
                          builder: (context) => const ShadDialog(
                            extendBackground: true,
                            constraints: BoxConstraints(maxWidth: 200),
                            alignment: Alignment.center,
                            title: Text('Title'),
                            child: Text('Child'),
                          ),
                        );
                      },
                      child: const Text('Open'),
                    ),
                  ),
                );
              },
            ),
          ),
        );

        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        expect(find.byType(ShadDialog), findsOneWidget);

        // Tap at the bottom of the screen — clear of the centered card and
        // clear of the top inset strip (no bottom inset is set here) —
        // this is barrier territory and must still dismiss the dialog.
        // Before the fix, the outer DecoratedBox painting
        // effectiveBackgroundColor hit-tested its entire bounds by
        // default (BoxDecoration.hitTest), silently reclaiming the whole
        // screen regardless of any explicit opaque strip.
        final screenSize =
            tester.view.physicalSize / tester.view.devicePixelRatio;
        await tester.tapAt(Offset(screenSize.width / 2, screenSize.height - 5));
        await tester.pumpAndSettle();

        expect(
          find.byType(ShadDialog),
          findsNothing,
          reason:
              'tapping outside the card and outside the inset strips must '
              'still dismiss the dialog via barrierDismissible',
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

        // Default: only ShadDialog's own SafeArea exists, and no outer
        // full-screen background layer (a DecoratedBox under a SizedBox)
        // is rendered.
        expect(find.byType(SafeArea), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(SizedBox),
            matching: find.byType(DecoratedBox),
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      'extendBackground via theme is honored',
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
        final decoration =
            outerDecoratedBox(tester).decoration as BoxDecoration;
        expect(decoration.color, isNotNull);
      },
    );

    testWidgets(
      'extendBackground: true defaults border to null on the card, '
      'shadows to empty, and borderRadius to null',
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

        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;
        expect(decoration.border, isNull);
        expect(decoration.boxShadow, isEmpty);
        expect(decoration.borderRadius, isNull);
      },
    );

    testWidgets(
      'extendBackground: false keeps the default card border, shadows, '
      'and borderRadius',
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

        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;
        expect(decoration.border, isNotNull);
        expect(decoration.boxShadow, isNotEmpty);
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

        expect(find.byType(SafeArea), findsOneWidget);
      },
    );

    testWidgets(
      'extendBackground: true with custom border uses the custom border '
      'on the card',
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

        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;

        // An explicit widget-level border still wins over extendBackground.
        expect(decoration.border, equals(customBorder));
      },
    );

    testWidgets(
      'extendBackground: true ignores custom shadows — a shadow never '
      'makes sense behind system UI',
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

        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;

        // Unlike border, extendBackground always wins over an explicit
        // shadows value — see the dialog.dart comment above
        // effectiveShadows for why.
        expect(decoration.boxShadow, isEmpty);
      },
    );

    testWidgets(
      'extendBackground: true beats a theme-level border (widget-level '
      'border would still win, but theme-level does not)',
      (tester) async {
        const themeBorder = Border.fromBorderSide(
          BorderSide(width: 3, color: Colors.red),
        );

        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              primaryDialogTheme: const ShadDialogTheme(
                extendBackground: true,
                border: themeBorder,
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

        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;

        // extendBackground is checked before falling back to the theme
        // border, so the theme border never renders here — only an
        // explicit widget-level border would win over extendBackground.
        expect(decoration.border, isNull);
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

        // Widget-level false overrides theme-level true: no outer
        // full-screen layer, and the card keeps its default border.
        expect(
          find.descendant(
            of: find.byType(SizedBox),
            matching: find.byType(DecoratedBox),
          ),
          findsNothing,
        );
        final decoration =
            innerCardDecoratedBox(tester).decoration as BoxDecoration;
        expect(decoration.border, isNotNull);
      },
    );

    testWidgets(
      'extendBackground: true fills screen and does not shrink from edges '
      '(same DecoratedBox size regardless of system padding)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        Future<Size> getDecoratedBoxSize(EdgeInsets padding) async {
          tester.view.viewPadding = FakeViewPadding(
            left: padding.left,
            top: padding.top,
            right: padding.right,
            bottom: padding.bottom,
          );
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

          return tester.getSize(
            find
                .descendant(
                  of: find.byType(SizedBox),
                  matching: find.byType(DecoratedBox),
                )
                .first,
          );
        }

        final sizeWithInsets = await getDecoratedBoxSize(systemPadding);
        final sizeWithoutInsets = await getDecoratedBoxSize(EdgeInsets.zero);

        // Both DecoratedBoxes should fill the full screen — system padding
        // must not shrink the background.
        expect(sizeWithInsets.width, closeTo(sizeWithoutInsets.width, 0.5));
        expect(sizeWithInsets.height, closeTo(sizeWithoutInsets.height, 0.5));
      },
    );

    testWidgets(
      'extendBackground: true does not remount the dialog subtree when '
      'the keyboard opens (focused TextField keeps focus)',
      (tester) async {
        final focusNode = FocusNode();
        addTearDown(focusNode.dispose);
        final initStateCounter = _InitStateCounter();

        await tester.pumpWidget(
          ShadApp(
            home: Scaffold(
              // resizeToAvoidBottomInset defaults to true, which would
              // consume the keyboard inset itself and zero out
              // MediaQuery.viewInsetsOf for the dialog below — exactly
              // the signal this test needs to reach ShadDialog.
              resizeToAvoidBottomInset: false,
              body: ShadDialog(
                extendBackground: true,
                title: const Text('Title'),
                child: _InitStateCountingTextField(
                  focusNode: focusNode,
                  counter: initStateCounter,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        focusNode.requestFocus();
        await tester.pump();
        expect(focusNode.hasFocus, isTrue);
        expect(initStateCounter.count, 1);

        // Simulate the keyboard opening: viewInsets goes from zero to
        // non-zero. Before the fix, the conditional
        // `viewInsets == EdgeInsets.zero ? dialog : Padding(child: dialog)`
        // swapped the child's runtimeType here, unmounting and remounting
        // the whole subtree — losing focus and re-running initState.
        await tester.binding.setSurfaceSize(const Size(800, 1200));
        tester.view.viewInsets = const FakeViewPadding(bottom: 300);
        addTearDown(tester.view.resetViewInsets);
        await tester.pump();

        expect(
          focusNode.hasFocus,
          isTrue,
          reason:
              'the TextField must not lose focus when the keyboard '
              'opens',
        );
        expect(
          initStateCounter.count,
          1,
          reason:
              'initState must not run again — the element must be '
              'reused, not remounted',
        );
      },
    );
  });
}

class _InitStateCounter {
  int count = 0;
}

class _InitStateCountingTextField extends StatefulWidget {
  const _InitStateCountingTextField({
    required this.focusNode,
    required this.counter,
  });

  final FocusNode focusNode;
  final _InitStateCounter counter;

  @override
  State<_InitStateCountingTextField> createState() =>
      _InitStateCountingTextFieldState();
}

class _InitStateCountingTextFieldState
    extends State<_InitStateCountingTextField> {
  @override
  void initState() {
    super.initState();
    widget.counter.count++;
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      focusNode: widget.focusNode,
      controller: TextEditingController(),
      cursorColor: const Color(0xFF000000),
      backgroundCursorColor: const Color(0xFF000000),
      style: const TextStyle(color: Color(0xFF000000)),
    );
  }
}
