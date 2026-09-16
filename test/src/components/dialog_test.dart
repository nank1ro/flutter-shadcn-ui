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
  });
}
