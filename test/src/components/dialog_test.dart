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

    testWidgets(
      'ShadDialog does not add extra top/bottom padding from system UI '
      'insets when centered on screen (#681)',
      (tester) async {
        const systemPadding = EdgeInsets.only(top: 62.4, bottom: 24.2);

        Future<Rect> pumpAndGetDialogRect(EdgeInsets padding) async {
          await tester.pumpWidget(
            MediaQuery(
              data: MediaQueryData(padding: padding),
              child: createTestWidget(
                const ShadDialog(
                  title: Text('Title'),
                  description: Text('Description'),
                  child: Text('Child'),
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

        final withoutInsets = await pumpAndGetDialogRect(EdgeInsets.zero);
        final withInsets = await pumpAndGetDialogRect(systemPadding);

        // The dialog card is small, centered, and far from the screen
        // edges, so simulated status bar / navigation bar insets must not
        // shrink its height: SafeArea should protect the edges of the
        // route, not pad the small centered dialog card itself. Before the
        // fix, SafeArea wrapped the dialog card directly, stealing
        // `systemPadding.vertical` (86.6px) from its height.
        expect(withInsets.height, closeTo(withoutInsets.height, 0.5));
      },
    );
  });
}
