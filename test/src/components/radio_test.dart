import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/form/fields/radio.dart';
import 'package:shadcn_ui/src/components/form/form.dart';
import 'package:shadcn_ui/src/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadRadioGroup and ShadRadio', () {
    testWidgets('renders with no initial selection correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            items: [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Check both radios are rendered (use a more specific finder)
      final radioFinder = find.byWidgetPredicate(
        (widget) => widget is ShadRadio<String>,
        description: 'ShadRadio<String>',
      );
      expect(
        radioFinder,
        findsNWidgets(2),
        reason: 'Should find 2 ShadRadio<String> widgets',
      );

      // Check label texts are present
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);

      // Check no radio is selected (no filled circles)
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(DecoratedBox),
        ),
        findsNothing,
        reason: 'No radio should be selected initially',
      );

      // Check Wrap layout
      final wrapFinder = find.byType(Wrap);
      expect(wrapFinder, findsOneWidget);
    });

    testWidgets('renders with initial selection correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            initialValue: 'option1',
            items: [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Check one radio is selected (filled circle)
      final animatedSwitcherFinder = find.byType(AnimatedSwitcher);
      expect(animatedSwitcherFinder, findsNWidgets(2));
      expect(
        find.descendant(
          of: animatedSwitcherFinder,
          matching: find.byType(DecoratedBox),
        ),
        findsOneWidget,
      );
    });

    testWidgets('toggles selection on tap', (WidgetTester tester) async {
      String? selectedValue;
      await tester.pumpWidget(
        createTestWidget(
          ShadRadioGroup<String>(
            onChanged: (value) => selectedValue = value,
            items: const [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Initially no selection
      expect(selectedValue, isNull);
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(DecoratedBox),
        ),
        findsNothing,
      );

      // Tap first option
      await tester.tap(find.text('Option 1'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Verify selection changed
      expect(selectedValue, 'option1');
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(DecoratedBox),
        ),
        findsOneWidget,
      );

      // Tap second option
      await tester.tap(find.text('Option 2'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Verify selection changed again
      expect(selectedValue, 'option2');
    });

    testWidgets('handles disabled state correctly', (
      WidgetTester tester,
    ) async {
      String? selectedValue;
      await tester.pumpWidget(
        createTestWidget(
          ShadRadioGroup<String>(
            enabled: false,
            onChanged: (value) => selectedValue = value,
            items: const [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Attempt to tap the ShadRadio widget instead of the Text
      final radioFinder = find.byWidgetPredicate(
        (widget) => widget is ShadRadio<String> && widget.value == 'option1',
        description: 'ShadRadio with value "option1"',
      );
      expect(
        radioFinder,
        findsOneWidget,
        reason: 'Should find the first ShadRadio',
      );
      await tester.tap(radioFinder);
      await tester.pumpAndSettle();

      // Verify no selection change
      expect(
        selectedValue,
        isNull,
        reason: 'Selection should not change when disabled',
      );

      // Check ShadDisabled is applied
      final disabledFinder = find.byType(ShadDisabled);
      expect(
        disabledFinder,
        findsWidgets,
        reason: 'ShadDisabled should be present in the tree',
      );

      // Optional: Verify the GestureDetector is disabled
      final gestureFinder = find.descendant(
        of: radioFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is GestureDetector && widget.onTap == null,
          description: 'Disabled GestureDetector',
        ),
      );
      expect(
        gestureFinder,
        findsOneWidget,
        reason: 'GestureDetector should have no onTap callback when disabled',
      );
    });

    testWidgets('applies custom size correctly', (WidgetTester tester) async {
      const customSize = 24.0;
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            items: [
              ShadRadio(
                value: 'option1',
                label: Text('Option 1'),
                size: customSize,
              ),
            ],
          ),
        ),
      );

      // Verify ShadRadio is rendered
      final radioFinder = find.byWidgetPredicate(
        (widget) => widget is ShadRadio<String>,
        description: 'ShadRadio<String>',
      );
      expect(
        radioFinder,
        findsOneWidget,
        reason: 'ShadRadio should be rendered in the group',
      );

      // Check SizedBox applies custom size
      final sizedBoxFinder = find.descendant(
        of: radioFinder,
        matching: find.ancestor(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(SizedBox),
        ),
      );
      expect(
        sizedBoxFinder,
        findsOneWidget,
        reason: 'Should find a SizedBox wrapping AnimatedSwitcher in ShadRadio',
      );
      final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
      expect(
        sizedBox.width,
        customSize,
        reason: 'Width should match customSize',
      );
      expect(
        sizedBox.height,
        customSize,
        reason: 'Height should match customSize',
      );
    });

    testWidgets('applies custom color correctly', (WidgetTester tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            initialValue: 'option1',
            items: [
              ShadRadio(
                value: 'option1',
                label: Text('Option 1'),
                color: customColor,
              ),
            ],
          ),
        ),
      );

      // Check DecoratedBox applies custom color when selected
      final decoratedBoxFinder = find.descendant(
        of: find.byType(AnimatedSwitcher),
        matching: find.byType(DecoratedBox),
      );
      expect(decoratedBoxFinder, findsOneWidget);
      final decoratedBox =
          tester.widget<DecoratedBox>(decoratedBoxFinder).decoration
              as BoxDecoration;
      expect(decoratedBox.color, customColor);
    });

    testWidgets('applies custom spacing correctly', (
      WidgetTester tester,
    ) async {
      const customSpacing = 16.0;
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            spacing: customSpacing,
            items: [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Check Wrap applies custom spacing
      final wrapFinder = find.byType(Wrap);
      expect(wrapFinder, findsOneWidget);
      final wrap = tester.widget<Wrap>(wrapFinder);
      expect(wrap.spacing, customSpacing);
    });

    testWidgets('handles focus correctly', (WidgetTester tester) async {
      final focusNode = FocusNode();
      await tester.pumpWidget(
        createTestWidget(
          ShadRadioGroup<String>(
            items: [
              ShadRadio(
                value: 'option1',
                label: const Text('Option 1'),
                focusNode: focusNode,
              ),
            ],
          ),
        ),
      );

      // Focus the radio
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

    testWidgets('renders with label and sublabel', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            items: [
              ShadRadio(
                value: 'option1',
                label: Text('Option 1'),
                sublabel: Text('Sublabel'),
              ),
            ],
          ),
        ),
      );

      // Check label and sublabel are rendered
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Sublabel'), findsOneWidget);

      // Check layout includes radio, label, and sublabel
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final columnFinder = find.descendant(
        of: rowFinder,
        matching: find.byType(Column),
      );
      expect(columnFinder, findsOneWidget);
    });

    testWidgets('updates initialValue correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            key: ValueKey('initial'),
            initialValue: 'option1',
            items: [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );

      // Check initial selection
      expect(
        find.descendant(
          of: find.byType(AnimatedSwitcher),
          matching: find.byType(DecoratedBox),
        ),
        findsOneWidget,
      );

      // Update with new initialValue
      await tester.pumpWidget(
        createTestWidget(
          const ShadRadioGroup<String>(
            key: ValueKey('updated'),
            initialValue: 'option2',
            items: [
              ShadRadio(value: 'option1', label: Text('Option 1')),
              ShadRadio(value: 'option2', label: Text('Option 2')),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify selection updated (count DecoratedBox instances)
      final decoratedBoxFinder = find.descendant(
        of: find.byType(AnimatedSwitcher),
        matching: find.byType(DecoratedBox),
      );
      expect(decoratedBoxFinder, findsOneWidget);
    });

    testWidgets('ShadRadio matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadRadioGroup<bool>(
            items: List.generate(
              3,
              (index) => ShadRadio<bool>(
                value: index.isEven,
                label: Text('Label $index'),
                sublabel: Text('Sublabel $index'),
              ),
            ),
          ),
        ),
      );

      expect(
        find.byType(ShadRadioGroup<bool>),
        matchesGoldenFile('goldens/radio.png'),
      );
    });
  });

  // https://github.com/nank1ro/flutter-shadcn-ui/issues/734
  group('ShadRadioGroup initialValue and controller', () {
    const items = <Widget>[
      ShadRadio<String>(value: 'a', label: Text('A')),
      ShadRadio<String>(value: 'b', label: Text('B')),
      ShadRadio<String>(value: 'c', label: Text('C')),
    ];

    Widget buildGroup({
      required String? initialValue,
      ShadRadioController<String>? controller,
    }) {
      return createTestWidget(
        ShadRadioGroup<String>(
          controller: controller,
          initialValue: initialValue,
          items: items,
        ),
      );
    }

    testWidgets(
      'external controller is not overwritten when initialValue changes',
      (tester) async {
        final controller = ShadRadioController<String>(value: 'b');

        await tester.pumpWidget(
          buildGroup(initialValue: 'a', controller: controller),
        );
        expect(controller.value, 'b');

        await tester.pumpWidget(
          buildGroup(initialValue: 'c', controller: controller),
        );
        expect(controller.value, 'b');

        await tester.pumpWidget(const SizedBox());
        controller.dispose();
      },
    );

    testWidgets('initialValue updates the internal controller', (tester) async {
      await tester.pumpWidget(buildGroup(initialValue: 'a'));

      ShadRadioController<String> internal() {
        return tester
            .state<ShadRadioGroupState<String>>(
              find.byType(ShadRadioGroup<String>),
            )
            .effectiveController;
      }

      expect(internal().value, 'a');

      await tester.pumpWidget(buildGroup(initialValue: 'c'));
      expect(internal().value, 'c');
    });

    testWidgets(
      'form field external controller is not overwritten by initialValue',
      (tester) async {
        final controller = ShadRadioController<String>(value: 'b');

        Widget field(String? initialValue) {
          return createTestWidget(
            ShadRadioGroupFormField<String>(
              controller: controller,
              initialValue: initialValue,
              items: items,
            ),
          );
        }

        await tester.pumpWidget(field('a'));
        expect(controller.value, 'b');

        await tester.pumpWidget(field('c'));
        expect(controller.value, 'b');

        await tester.pumpWidget(const SizedBox());
        controller.dispose();
      },
    );

    testWidgets(
      'form field initialValue updates the internal controller',
      (tester) async {
        Widget field(String? initialValue) {
          return createTestWidget(
            ShadRadioGroupFormField<String>(
              initialValue: initialValue,
              items: items,
            ),
          );
        }

        await tester.pumpWidget(field('a'));

        ShadRadioController<String> internal() {
          return tester
              .state<ShadFormBuilderRadioGroupState<String>>(
                find.byType(ShadRadioGroupFormField<String>),
              )
              .controller;
        }

        expect(internal().value, 'a');

        await tester.pumpWidget(field('c'));
        expect(internal().value, 'c');
      },
    );

    testWidgets(
      'removing the external controller keeps the current field value',
      (tester) async {
        final formKey = GlobalKey<ShadFormState>();
        final external = ShadRadioController<String>(value: 'b');
        ShadRadioController<String>? controller = external;

        Widget field() {
          return createTestWidget(
            ShadForm(
              key: formKey,
              child: ShadRadioGroupFormField<String>(
                id: 'choice',
                controller: controller,
                initialValue: 'a',
                items: items,
              ),
            ),
          );
        }

        await tester.pumpWidget(field());
        expect(tester.takeException(), isNull);
        expect(external.value, 'b');
        expect(formKey.currentState!.value['choice'], 'b');

        controller = null;
        await tester.pumpWidget(field());
        expect(tester.takeException(), isNull);

        final state = tester.state<ShadFormBuilderRadioGroupState<String>>(
          find.byType(ShadRadioGroupFormField<String>),
        );
        expect(state.controller.value, 'b');
        expect(state.controller, isNot(same(external)));
        expect(state.value, 'b');
        expect(formKey.currentState!.value['choice'], 'b');

        await tester.pumpWidget(const SizedBox());
        external.dispose();
      },
    );
  });

  group('ShadRadioGroupFormField', () {
    testWidgets('calls onChanged once per selection change', (
      WidgetTester tester,
    ) async {
      // Repro from https://github.com/nank1ro/flutter-shadcn-ui/issues/735.
      final controller = ShadRadioController<String>(value: 'a');
      final calls = <String?>[];
      final formKey = GlobalKey<ShadFormState>();

      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: ShadRadioGroupFormField<String>(
              id: 'r',
              controller: controller,
              onChanged: calls.add,
              items: const [
                ShadRadio(value: 'a', label: Text('A')),
                ShadRadio(value: 'b', label: Text('B')),
              ],
            ),
          ),
        ),
      );

      ShadFormBuilderRadioGroupState<String> fieldState() {
        return tester.state<ShadFormBuilderRadioGroupState<String>>(
          find.byType(ShadRadioGroupFormField<String>),
        );
      }

      expect(calls, isEmpty);
      expect(fieldState().value, 'a');
      expect(controller.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');

      controller.value = 'b';
      await tester.pump();

      expect(calls, ['b']);
      expect(fieldState().value, 'b');
      expect(controller.value, 'b');
      expect(formKey.currentState!.value['r'], 'b');

      calls.clear();
      await tester.tap(find.text('A'));
      await tester.pump();

      expect(calls, ['a']);
      expect(fieldState().value, 'a');
      expect(controller.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');

      // Selecting the current value again must not notify.
      calls.clear();
      await tester.tap(find.text('A'));
      await tester.pump();
      controller.value = 'a';
      await tester.pump();

      expect(calls, isEmpty);
      expect(fieldState().value, 'a');
      expect(controller.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');

      calls.clear();
      controller.value = 'b';
      await tester.pump();
      expect(calls, ['b']);

      calls.clear();
      formKey.currentState!.reset();
      await tester.pump();

      expect(calls, ['a']);
      expect(fieldState().value, 'a');
      expect(controller.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');
    });

    testWidgets('updates the field after the controller is swapped', (
      WidgetTester tester,
    ) async {
      final calls = <String?>[];
      final formKey = GlobalKey<ShadFormState>();
      final fieldKey = GlobalKey<ShadFormBuilderRadioGroupState<String>>();
      // Matches the value selected while the field still owns its controller.
      final external = ShadRadioController<String>(value: 'b');
      addTearDown(external.dispose);

      Widget buildField({ShadRadioController<String>? controller}) {
        return createTestWidget(
          ShadForm(
            key: formKey,
            child: ShadRadioGroupFormField<String>(
              key: fieldKey,
              id: 'r',
              initialValue: 'a',
              controller: controller,
              onChanged: calls.add,
              items: const [
                ShadRadio(value: 'a', label: Text('A')),
                ShadRadio(value: 'b', label: Text('B')),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildField());

      final fieldState = fieldKey.currentState!;
      expect(calls, isEmpty);
      expect(fieldState.value, 'a');
      expect(fieldState.controller.value, 'a');

      await tester.tap(find.text('B'));
      await tester.pump();

      expect(calls, ['b']);
      expect(fieldState.value, 'b');
      expect(fieldState.controller.value, 'b');
      expect(formKey.currentState!.value['r'], 'b');

      // Owned -> external. The same state must keep listening on the new
      // controller, or later writes and taps never reach the field.
      calls.clear();
      await tester.pumpWidget(buildField(controller: external));

      expect(fieldKey.currentState, same(fieldState));
      expect(fieldState.controller, same(external));
      expect(calls, isEmpty);

      external.value = 'a';
      await tester.pump();

      expect(calls, ['a']);
      expect(fieldState.value, 'a');
      expect(external.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');

      calls.clear();
      await tester.tap(find.text('B'));
      await tester.pump();

      expect(calls, ['b']);
      expect(fieldState.value, 'b');
      expect(external.value, 'b');
      expect(formKey.currentState!.value['r'], 'b');

      // External -> owned. Selections and writes must follow the new internal
      // controller, and the detached external controller must not notify.
      calls.clear();
      await tester.pumpWidget(buildField());

      final owned = fieldState.controller;
      expect(fieldKey.currentState, same(fieldState));
      expect(owned, isNot(same(external)));
      expect(owned.value, 'b');
      expect(calls, isEmpty);

      owned.value = 'a';
      await tester.pump();

      expect(calls, ['a']);
      expect(fieldState.value, 'a');
      expect(owned.value, 'a');
      expect(formKey.currentState!.value['r'], 'a');

      calls.clear();
      await tester.tap(find.text('B'));
      await tester.pump();

      expect(calls, ['b']);
      expect(fieldState.value, 'b');
      expect(owned.value, 'b');
      expect(formKey.currentState!.value['r'], 'b');

      calls.clear();
      external.value = 'a';
      await tester.pump();

      expect(calls, isEmpty);
      expect(fieldState.value, 'b');
      expect(owned.value, 'b');
      expect(formKey.currentState!.value['r'], 'b');
    });

    testWidgets(
      'syncs the field when a replacement controller already differs',
      (WidgetTester tester) async {
        final calls = <String?>[];
        final formKey = GlobalKey<ShadFormState>();
        final fieldKey = GlobalKey<ShadFormBuilderRadioGroupState<String>>();
        final external = ShadRadioController<String>(value: 'b');
        addTearDown(external.dispose);

        Widget buildField({ShadRadioController<String>? controller}) {
          return createTestWidget(
            ShadForm(
              key: formKey,
              child: ShadRadioGroupFormField<String>(
                key: fieldKey,
                id: 'r',
                initialValue: 'a',
                controller: controller,
                onChanged: calls.add,
                items: const [
                  ShadRadio(value: 'a', label: Text('A')),
                  ShadRadio(value: 'b', label: Text('B')),
                ],
              ),
            ),
          );
        }

        await tester.pumpWidget(buildField());

        final fieldState = fieldKey.currentState!;
        expect(calls, isEmpty);
        expect(fieldState.value, 'a');
        expect(formKey.currentState!.value['r'], 'a');

        // Owned -> external, where the external controller already holds a
        // different selection than the field.
        await tester.pumpWidget(buildField(controller: external));

        expect(fieldKey.currentState, same(fieldState));
        expect(fieldState.controller, same(external));
        expect(fieldState.value, 'b');
        expect(external.value, 'b');
        expect(formKey.currentState!.value['r'], 'b');
        // Attaching the controller is not a selection change.
        expect(calls, isEmpty);

        external.value = 'a';
        await tester.pump();

        expect(calls, ['a']);
        expect(fieldState.value, 'a');
        expect(external.value, 'a');
        expect(formKey.currentState!.value['r'], 'a');
      },
    );
  });
}
