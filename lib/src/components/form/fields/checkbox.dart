import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/checkbox.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

class ShadCheckboxFormField extends ShadFormBuilderField<bool> {
  ShadCheckboxFormField({
    required super.id,
    super.key,
    super.onSaved,
    super.label,
    super.error,
    super.description,
    void Function(bool)? onChanged,
    super.valueTransformer,
    super.onReset,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    required bool initialValue,
    super.decoration,
    super.focusNode,
    String? Function(bool)? validator,
    ShadDecoration? inputDecoration,
    BorderRadius? radius,
    double? size,
    Duration? duration,
    Widget? icon,
    Color? color,
    double? borderWidth,
    Widget? inputLabel,
    Widget? inputSublabel,
    EdgeInsets? padding,
    TextDirection? direction,
  }) : super(
          initialValue: initialValue,
          onChanged: (!enabled || onChanged == null)
              ? null
              : (v) => onChanged(v ?? false),
          validator: validator == null
              ? null
              : (v) {
                  return validator(v ?? false);
                },
          builder: (field) {
            final state = field as _ShadFormBuilderCheckboxState;
            return ShadCheckbox(
              value: state.value!,
              onChanged: onChanged != null && state.enabled
                  ? (v) {
                      state.didChange(v);
                      onChanged(v);
                    }
                  : null,
              focusNode: state.focusNode,
              decoration: inputDecoration,
              radius: radius,
              size: size,
              duration: duration,
              icon: icon,
              color: color,
              borderWidth: borderWidth,
              label: inputLabel,
              sublabel: inputSublabel,
              padding: padding,
              direction: direction,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadCheckboxFormField, bool> createState() =>
      _ShadFormBuilderCheckboxState();
}

class _ShadFormBuilderCheckboxState
    extends ShadFormBuilderFieldState<ShadCheckboxFormField, bool> {}
