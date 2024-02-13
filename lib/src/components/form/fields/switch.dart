import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

class ShadSwitchFormField extends ShadFormBuilderField<bool> {
  ShadSwitchFormField({
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
    Color? thumbColor,
    Color? trackColor,
    Color? uncheckedTrackColor,
    Color? checkedTrackColor,
    double? width,
    double? margin,
    Duration? duration,
    BorderRadius? radius,
    ShadDecoration? inputDecoration,
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
            return ShadSwitch(
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
              duration: duration,
              label: inputLabel,
              sublabel: inputSublabel,
              padding: padding,
              direction: direction,
              width: width,
              margin: margin,
              thumbColor: thumbColor,
              trackColor: trackColor,
              uncheckedTrackColor: uncheckedTrackColor,
              checkedTrackColor: checkedTrackColor,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadSwitchFormField, bool> createState() =>
      _ShadFormBuilderCheckboxState();
}

class _ShadFormBuilderCheckboxState
    extends ShadFormBuilderFieldState<ShadSwitchFormField, bool> {}
