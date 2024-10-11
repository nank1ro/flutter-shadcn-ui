import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/radio.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

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

    /// {@macro ShadRadioGroup.axis}
    Axis? axis,

    /// {@macro ShadRadioGroup.spacing}
    double? spacing,

    /// {@macro ShadRadioGroup.runSpacing}
    double? runSpacing,

    /// {@macro ShadRadioGroup.alignment}
    WrapAlignment? alignment,

    /// {@macro ShadRadioGroup.runAlignment}
    WrapAlignment? runAlignment,

    /// {@macro ShadRadioGroup.crossAxisAlignment}
    WrapCrossAlignment? crossAxisAlignment,
  }) : super(
          decorationBuilder: (context) =>
              ShadTheme.of(context).radioTheme.decoration ??
              const ShadDecoration(),
          builder: (field) {
            final state = field as _ShadFormBuilderRadioGroupState;
            return ShadRadioGroup(
              items: items,
              onChanged: state.didChange,
              enabled: state.enabled,
              initialValue: initialValue,
              axis: axis,
              spacing: spacing,
              runSpacing: runSpacing,
              alignment: alignment,
              runAlignment: runAlignment,
              crossAxisAlignment: crossAxisAlignment,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> createState() =>
      _ShadFormBuilderRadioGroupState<T>();
}

class _ShadFormBuilderRadioGroupState<T>
    extends ShadFormBuilderFieldState<ShadRadioGroupFormField<T>, T> {}
