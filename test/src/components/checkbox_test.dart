import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/checkbox.dart'; // Adjust import path based on your project structure
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

import '../../extra/pump_async_widget.dart'; // Assuming this is available in your project

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadCheckbox', () {
    testWidgets('renders unchecked state correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: false,
          ),
        ),
      );

      // Check no icon (unchecked state) inside AnimatedSwitcher
      final animatedSwitcherFinder = find.byType(AnimatedSwitcher);
      expect(animatedSwitcherFinder, findsOneWidget);
      expect(
        find.descendant(
          of: animatedSwitcherFinder,
          matching: find.byType(Icon),
        ),
        findsNothing,
      );

      // Check basic layout (Row with checkbox)
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders checked state correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: true,
          ),
        ),
      );

      // Check icon is present (checked state) inside AnimatedSwitcher
      final animatedSwitcherFinder = find.byType(AnimatedSwitcher);
      expect(animatedSwitcherFinder, findsOneWidget);
      expect(
        find.descendant(
          of: animatedSwitcherFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders with label and sublabel', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: false,
            label: Text('Checkbox Label'),
            sublabel: Text('Checkbox Sublabel'),
          ),
        ),
      );

      // Check label and sublabel are rendered
      expect(find.text('Checkbox Label'), findsOneWidget);
      expect(find.text('Checkbox Sublabel'), findsOneWidget);

      // Check layout includes checkbox, label, and sublabel in a Row and Column
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final columnFinder =
          find.descendant(of: rowFinder, matching: find.byType(Column));
      expect(columnFinder, findsOneWidget);
      expect(
        find.descendant(of: columnFinder, matching: find.byType(Text)),
        findsNWidgets(2),
      );
    });

    testWidgets('toggles state on tap', (WidgetTester tester) async {
      var value = false;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCheckbox(
            value: value,
            onChanged: (newValue) => value = newValue,
            key: ValueKey(value), // Force rebuild on value change
          ),
        ),
      );

      // Initially unchecked
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(Icon),
        ),
        findsNothing,
        reason: 'Initially unchecked, no icon should be present',
      );

      // Tap to toggle
      await tester.tap(find.byType(ShadCheckbox));
      await tester.pumpAsyncWidget(
        // Rebuild with new state
        createTestWidget(
          ShadCheckbox(
            value: true,
            onChanged: (newValue) => value = newValue,
            key: const ValueKey(true),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Verify state changed to checked
      expect(value, true, reason: 'Value should toggle to true after tap');
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(Icon),
        ),
        findsOneWidget,
        reason:
            '''Checked state should show the checkmark icon within AnimatedSwitcher''',
      );

      // Tap again to toggle back
      await tester.tap(find.byType(ShadCheckbox));
      await tester.pumpAsyncWidget(
        // Rebuild with new state
        createTestWidget(
          ShadCheckbox(
            value: false,
            onChanged: (newValue) => value = newValue,
            key: const ValueKey(false),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Verify state changed to unchecked
      expect(
        value,
        false,
        reason: 'Value should toggle back to false after second tap',
      );
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(Icon),
        ),
        findsNothing,
        reason: 'Unchecked state should hide the icon',
      );
    });

    testWidgets('handles disabled state correctly',
        (WidgetTester tester) async {
      var value = false;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCheckbox(
            value: value,
            enabled: false,
            onChanged: (newValue) => value = newValue,
          ),
        ),
      );

      // Attempt to tap the checkbox
      await tester.tap(find.byType(ShadCheckbox));
      await tester.pumpAndSettle();

      // Verify onChanged was not called (still false)
      expect(value, false);

      // Check ShadDisabled is applied with absorbing pointer events
      final disabledFinder = find.byType(ShadDisabled);
      expect(
        disabledFinder,
        findsNWidgets(2),
      ); // One for checkbox, one for outer wrapper
      final innerDisabled = tester.widget<ShadDisabled>(disabledFinder.first);
      expect(innerDisabled.disabled, true);
    });

    testWidgets('applies custom size correctly', (WidgetTester tester) async {
      const customSize = 24.0;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: true,
            size: customSize,
          ),
        ),
      );

      // Check SizedBox applies custom size (target the one wrapping
      // AnimatedSwitcher)
      final sizedBoxFinder = find.descendant(
        of: find.byType(ShadCheckbox),
        matching: find.ancestor(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBoxFinder, findsOneWidget);
      final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
      expect(sizedBox.width, customSize);
      expect(sizedBox.height, customSize);

      // Check icon uses custom size
      final iconFinder = find.byType(Icon);
      expect(iconFinder, findsOneWidget);
      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.size, customSize);
    });

    testWidgets('applies custom color correctly', (WidgetTester tester) async {
      const customColor = Colors.red;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: true,
            color: customColor,
          ),
        ),
      );

      // Check ShadDecorator applies custom color when checked
      final decoratorFinder = find.byType(ShadDecorator);
      expect(decoratorFinder, findsOneWidget);
      final decorator = tester.widget<ShadDecorator>(decoratorFinder);
      expect(decorator.decoration?.color, customColor);
    });

    testWidgets('applies custom padding correctly',
        (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(16);
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: false,
            label: Text('Label'),
            padding: customPadding,
          ),
        ),
      );

      // Check Padding between checkbox and label applies custom padding
      final paddingFinder = find.descendant(
        of: find.byType(Row),
        matching: find.ancestor(
          of: find.byType(Column), // Target the Column with label/sublabel
          matching: find.byType(Padding),
        ),
      );
      expect(paddingFinder, findsOneWidget);
      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, customPadding);
    });

    testWidgets('handles focus correctly', (WidgetTester tester) async {
      final focusNode = FocusNode();
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCheckbox(
            value: false,
            focusNode: focusNode,
          ),
        ),
      );

      // Focus the checkbox
      focusNode.requestFocus();
      await tester.pumpAndSettle();

      // Verify focus is applied
      expect(focusNode.hasFocus, true);

      // Check ShadDecorator reflects focused state
      final decoratorFinder = find.byType(ShadDecorator);
      expect(decoratorFinder, findsOneWidget);
      final decorator = tester.widget<ShadDecorator>(decoratorFinder);
      expect(decorator.focused, true);
    });

    testWidgets('renders without label and sublabel',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCheckbox(
            value: false,
          ),
        ),
      );

      // Check only checkbox is rendered (no label/sublabel)
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Column), findsNothing); // No Column for label/sublabel
      expect(find.text('Label'), findsNothing);
    });
  });
}
