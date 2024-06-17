import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/radio.dart';

class ShadRadioGroupFormField<T> extends ShadFormBuilderField<T> {
  ShadRadioGroupFormField({
    super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.initialValue,
    super.focusNode,
    super.validator,
    required Iterable<Widget> items,
  }) : super(
          builder: (field) {
            final state = field as _ShadFormBuilderRadioGroupState;
            return ShadRadioGroup(
              items: items,
              onChanged: state.didChange,
              enabled: enabled,
              initialValue: initialValue,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> createState() =>
      _ShadFormBuilderRadioGroupState<T>();
}

class _ShadFormBuilderRadioGroupState<T>
    extends ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> {}
