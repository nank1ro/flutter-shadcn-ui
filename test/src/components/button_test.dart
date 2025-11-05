import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/button.dart'; // Adjust import path based on your project structure
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadButton', () {
    testWidgets('renders primary variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            child: Text('Primary Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Primary Button'), findsOneWidget);

      // Check basic layout (Row should contain the child)
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      // Verify the button is enabled by default
      expect(find.byType(ShadButton), findsOneWidget);
      final button = tester.widget<ShadButton>(find.byType(ShadButton));
      expect(button.enabled, true);
    });

    testWidgets('renders destructive variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.destructive(
            child: Text('Destructive Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Destructive Button'), findsOneWidget);

      // Check basic layout
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders outline variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.outline(
            child: Text('Outline Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Outline Button'), findsOneWidget);

      // Check basic layout
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders secondary variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.secondary(
            child: Text('Secondary Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Secondary Button'), findsOneWidget);

      // Check basic layout
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders ghost variant correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.ghost(
            child: Text('Ghost Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Ghost Button'), findsOneWidget);

      // Check basic layout
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders link variant correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.link(
            child: Text('Link Button'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Link Button'), findsOneWidget);

      // Check basic layout (no leading/trailing, so just the child)
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders with leading and trailing widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button with Icons'),
          ),
        ),
      );

      // Check if all components render
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Button with Icons'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      // Check layout includes all three widgets in a Row
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      expect(
        find.descendant(of: rowFinder, matching: find.byType(Icon)),
        findsNWidgets(2),
      );
      expect(
        find.descendant(
          of: rowFinder,
          matching: find.text('Button with Icons'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('applies custom styles correctly', (WidgetTester tester) async {
      const customBackgroundColor = Colors.blue;
      const customPadding = EdgeInsets.all(20);
      const customWidth = 200.0;

      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            backgroundColor: customBackgroundColor,
            padding: customPadding,
            width: customWidth,
            child: Text('Styled Button'),
          ),
        ),
      );

      // Find the ShadButton widget
      final buttonFinder = find.byType(ShadButton);
      expect(buttonFinder, findsOneWidget);

      // Find the ConstrainedBox that applies width constraints
      final constrainedBoxFinder = find.descendant(
        of: buttonFinder,
        matching: find.byType(ConstrainedBox),
      );
      expect(constrainedBoxFinder, findsOneWidget);
      final constrainedBox = tester.widget<ConstrainedBox>(constrainedBoxFinder);
      expect(constrainedBox.constraints.minWidth, customWidth);

      // Find the Padding widget
      final paddingFinder = find.descendant(
        of: constrainedBoxFinder,
        matching: find.byType(Padding),
      );
      expect(paddingFinder, findsOneWidget);
      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, customPadding);

      // Find the ShadDecorator and check background color
      final decoratorFinder = find.descendant(
        of: buttonFinder,
        matching: find.byType(ShadDecorator),
      );
      expect(decoratorFinder, findsOneWidget);
      final decorator = tester.widget<ShadDecorator>(decoratorFinder);
      expect(decorator.decoration?.color, customBackgroundColor);
    });

    testWidgets('handles disabled state correctly', (
      WidgetTester tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        createTestWidget(
          ShadButton(
            enabled: false,
            onPressed: () => pressed = true,
            child: const Text('Disabled Button'),
          ),
        ),
      );

      // Verify the button renders
      expect(find.text('Disabled Button'), findsOneWidget);

      // Verify onPressed isn’t callable without tapping (since it’s disabled)
      expect(pressed, false);

      // Check opacity is reduced for disabled state
      final opacityFinder = find.descendant(
        of: find.byType(ShadButton),
        matching: find.byType(Opacity),
      );
      expect(opacityFinder, findsOneWidget);
      final opacity = tester.widget<Opacity>(opacityFinder);
      expect(opacity.opacity, 0.5);

      // Verify AbsorbPointer is present and absorbing events
      final absorbPointerFinder = find.descendant(
        of: find.byType(ShadButton),
        matching: find.byType(AbsorbPointer),
      );
      expect(absorbPointerFinder, findsOneWidget);
      final absorbPointer = tester.widget<AbsorbPointer>(absorbPointerFinder);
      expect(absorbPointer.absorbing, true);
    });

    testWidgets('handles focus correctly', (WidgetTester tester) async {
      final focusNode = FocusNode();
      await tester.pumpWidget(
        createTestWidget(
          ShadButton(
            focusNode: focusNode,
            child: const Text('Focusable Button'),
          ),
        ),
      );

      // Focus the button
      focusNode.requestFocus();
      await tester.pumpAndSettle();

      // Verify the button is focused
      expect(focusNode.hasFocus, true);

      // Check that ShadDecorator reflects the focused state
      final decoratorFinder = find.descendant(
        of: find.byType(ShadButton),
        matching: find.byType(ShadDecorator),
      );
      expect(decoratorFinder, findsOneWidget);
      final decorator = tester.widget<ShadDecorator>(decoratorFinder);
      expect(decorator.focused, true);
    });

    testWidgets('handles text direction correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            textDirection: TextDirection.rtl,
            leading: Icon(Icons.arrow_back),
            trailing: Icon(Icons.arrow_forward),
            child: Text('RTL Button'),
          ),
        ),
      );

      // Check Row reflects RTL text direction
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final row = tester.widget<Row>(rowFinder);
      expect(row.textDirection, TextDirection.rtl);

      expect(row.children.elementAt(0), isA<Icon>()); // trailing
      expect(row.children.elementAt(1), isA<SizedBox>()); // space
      expect(row.children.elementAt(2), isA<Text>()); // child
      expect(row.children.elementAt(3), isA<SizedBox>()); // space
      expect(row.children.elementAt(4), isA<Icon>()); // leading
    });

    testWidgets('handles size variations correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            size: ShadButtonSize.lg,
            child: Text('Large Button'),
          ),
        ),
      );

      // Verify the button renders with large size
      final constrainedBoxFinder = find.descendant(
        of: find.byType(ShadButton),
        matching: find.byType(ConstrainedBox),
      );
      expect(constrainedBoxFinder, findsOneWidget);
      final constrainedBox = tester.widget<ConstrainedBox>(constrainedBoxFinder);
      final theme = ShadTheme.of(tester.element(find.byType(ShadButton)));
      expect(constrainedBox.constraints.minHeight,
          theme.buttonSizesTheme.lg?.height);
    });

    testWidgets('executes onPressed callback on tap', (
      WidgetTester tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        createTestWidget(
          ShadButton(
            child: const Text('Press Me'),
            onPressed: () => pressed = true,
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.text('Press Me'));
      await tester.pumpAndSettle();

      // Verify onPressed was called
      expect(pressed, true);
    });

    testWidgets('ShadButton matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button.png'),
      );
    });

    testWidgets('ShadButton.destructive matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.destructive(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button_destructive.png'),
      );
    });

    testWidgets('ShadButton.outline matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.outline(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button_outline.png'),
      );
    });

    testWidgets('ShadButton.secondary matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.secondary(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button_secondary.png'),
      );
    });

    testWidgets('ShadButton.ghost matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.ghost(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button_ghost.png'),
      );
    });

    testWidgets('ShadButton.link matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadButton.link(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Button'),
          ),
        ),
      );

      expect(
        find.byType(ShadButton),
        matchesGoldenFile('goldens/button_link.png'),
      );
    });
  });
}
