import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/dialog.dart';

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
  });
}
