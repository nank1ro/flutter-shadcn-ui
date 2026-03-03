// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: Center(child: child)));
  }

  group('ShadPortal with ShadAnchorAuto', () {
    testWidgets(
      'portal becomes visible with followerAnchor bottomCenter',
      (tester) async {
        // Regression test for https://github.com/nank1ro/flutter-shadcn-ui/issues/575
        // When followerAnchor is bottomCenter and targetAnchor is bottomCenter,
        // the computed followerOffset is Offset.zero. The calculated target
        // position may not change between layout passes, which previously
        // prevented the overlay from becoming visible.
        await tester.pumpWidget(
          createTestWidget(
            ShadPortal(
              visible: true,
              anchor: const ShadAnchorAuto(
                followerAnchor: Alignment.bottomCenter,
                targetAnchor: Alignment.bottomCenter,
              ),
              portalBuilder: (context) => const Text('portal content'),
              child: const SizedBox(width: 100, height: 40),
            ),
          ),
        );

        // Allow multiple frames for position calculation and visibility update.
        await tester.pumpAndSettle();

        expect(find.text('portal content'), findsOneWidget);

        // Verify the portal content is actually visible (not hidden via
        // Visibility.maintain).
        final visibilityFinder = find.ancestor(
          of: find.text('portal content'),
          matching: find.byType(Visibility),
        );
        final visibilityWidget =
            tester.widget<Visibility>(visibilityFinder.first);
        expect(visibilityWidget.visible, isTrue);
      },
    );

    testWidgets(
      'portal becomes visible with followerAnchor topCenter',
      (tester) async {
        await tester.pumpWidget(
          createTestWidget(
            ShadPortal(
              visible: true,
              anchor: const ShadAnchorAuto(
                followerAnchor: Alignment.topCenter,
                targetAnchor: Alignment.topCenter,
              ),
              portalBuilder: (context) => const Text('portal content'),
              child: const SizedBox(width: 100, height: 40),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('portal content'), findsOneWidget);
        final visibilityFinder = find.ancestor(
          of: find.text('portal content'),
          matching: find.byType(Visibility),
        );
        final visibilityWidget =
            tester.widget<Visibility>(visibilityFinder.first);
        expect(visibilityWidget.visible, isTrue);
      },
    );

    testWidgets('portal is hidden when visible is false', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadPortal(
            visible: false,
            anchor: const ShadAnchorAuto(
              followerAnchor: Alignment.bottomCenter,
              targetAnchor: Alignment.bottomCenter,
            ),
            portalBuilder: (context) => const Text('portal content'),
            child: const SizedBox(width: 100, height: 40),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('portal content'), findsNothing);
    });

    testWidgets(
      'portal toggles visibility correctly',
      (tester) async {
        var visible = false;
        late StateSetter setState;

        await tester.pumpWidget(
          createTestWidget(
            StatefulBuilder(
              builder: (context, setStateFn) {
                setState = setStateFn;
                return ShadPortal(
                  visible: visible,
                  anchor: const ShadAnchorAuto(
                    followerAnchor: Alignment.bottomCenter,
                    targetAnchor: Alignment.bottomCenter,
                  ),
                  portalBuilder: (context) => const Text('portal content'),
                  child: const SizedBox(width: 100, height: 40),
                );
              },
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.text('portal content'), findsNothing);

        // Show the portal.
        setState(() => visible = true);
        await tester.pumpAndSettle();
        expect(find.text('portal content'), findsOneWidget);

        // Hide the portal.
        setState(() => visible = false);
        await tester.pumpAndSettle();
        expect(find.text('portal content'), findsNothing);
      },
    );
  });
}
