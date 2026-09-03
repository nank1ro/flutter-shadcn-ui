import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/tooltip.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadTooltip', () {
    testWidgets('ShadDatePicker matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTooltip(
            builder: (context) {
              return const Text('Tooltip');
            },
            child: const Text('trigger'),
          ),
        ),
      );

      expect(
        find.byType(ShadTooltip),
        matchesGoldenFile('goldens/tooltip.png'),
      );
      await tester.pumpAndSettle();
    });

    // Pumps a tooltip whose button pushes a second route, on the navigator
    // above the one holding the tooltip when [nested], and a non-opaque route
    // such as a dialog when not [opaque].
    Future<void> pumpNavigationApp(
      WidgetTester tester, {
      bool nested = false,
      bool opaque = true,
    }) {
      const secondPage = Scaffold(body: Text('second page'));
      final tooltip = Builder(
        builder: (context) => ShadTooltip(
          builder: (context) => const Text('Tooltip'),
          child: ShadButton(
            onPressed: () => Navigator.of(context, rootNavigator: nested).push(
              opaque
                  ? MaterialPageRoute<void>(builder: (_) => secondPage)
                  : RawDialogRoute<void>(pageBuilder: (_, _, _) => secondPage),
            ),
            child: const Text('trigger'),
          ),
        ),
      );
      return tester.pumpWidget(
        createTestWidget(
          nested
              ? Navigator(
                  onGenerateRoute: (_) =>
                      MaterialPageRoute<void>(builder: (_) => tooltip),
                )
              : tooltip,
        ),
      );
    }

    // Pops the route pushed by the button of [pumpNavigationApp].
    Future<void> popSecondPage(WidgetTester tester) async {
      expect(find.text('second page'), findsOneWidget);
      Navigator.of(tester.element(find.text('second page'))).pop();
      await tester.pumpAndSettle();
    }

    testWidgets('is hidden again after a tap pushes and pops a route', (
      tester,
    ) async {
      await pumpNavigationApp(tester);

      // On touch devices a tap shows the tooltip, and there is no pointer to
      // exit the button and hide it again.
      await tester.tap(find.text('trigger'));
      // Two pumps: one for the tap's onTap to toggle the tooltip open and
      // push the route, another for the pushed route and the reopened
      // tooltip to actually build, before anything settles and this fix
      // hides the tooltip again.
      await tester.pump();
      await tester.pump();
      expect(find.text('Tooltip'), findsOneWidget);
      await tester.pumpAndSettle();
      await popSecondPage(tester);

      expect(find.text('Tooltip'), findsNothing);
    });

    testWidgets('is hidden again when a route of a parent navigator is pushed '
        'and popped', (tester) async {
      await pumpNavigationApp(tester, nested: true);

      await tester.tap(find.text('trigger'));
      // Two pumps: one for the tap's onTap to toggle the tooltip open and
      // push the route, another for the pushed route and the reopened
      // tooltip to actually build, before anything settles and this fix
      // hides the tooltip again.
      await tester.pump();
      await tester.pump();
      expect(find.text('Tooltip'), findsOneWidget);
      await tester.pumpAndSettle();
      await popSecondPage(tester);

      expect(find.text('Tooltip'), findsNothing);
    });

    testWidgets('is hidden again after a tap opens and closes a dialog', (
      tester,
    ) async {
      // A dialog is not opaque, so it does not disable the tickers of the page
      // below it.
      await pumpNavigationApp(tester, opaque: false);

      await tester.tap(find.text('trigger'));
      // Two pumps: one for the tap's onTap to toggle the tooltip open and
      // push the route, another for the pushed route and the reopened
      // tooltip to actually build, before anything settles and this fix
      // hides the tooltip again.
      await tester.pump();
      await tester.pump();
      expect(find.text('Tooltip'), findsOneWidget);
      await tester.pumpAndSettle();
      await popSecondPage(tester);

      expect(find.text('Tooltip'), findsNothing);
    });

    testWidgets('is hovered again after a route push and pop with a mouse', (
      tester,
    ) async {
      await pumpNavigationApp(tester);
      final trigger = find.text('trigger');

      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      addTearDown(mouse.removePointer);

      await mouse.moveTo(tester.getCenter(trigger));
      await tester.pumpAndSettle();
      expect(find.text('Tooltip'), findsOneWidget);

      await tester.tap(trigger, kind: PointerDeviceKind.mouse);
      await tester.pumpAndSettle();

      // The pointer is moved away while the second page is visible.
      await mouse.moveTo(const Offset(700, 500));
      await tester.pumpAndSettle();
      await popSecondPage(tester);
      expect(find.text('Tooltip'), findsNothing);

      // The hover state was reset, so hovering the button shows it again.
      await mouse.moveTo(tester.getCenter(trigger));
      await tester.pumpAndSettle();
      expect(find.text('Tooltip'), findsOneWidget);
    });
  });
}
