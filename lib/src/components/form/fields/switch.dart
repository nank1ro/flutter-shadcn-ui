import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

class ShadSwitchFormField extends ShadFormBuilderField<bool> {
  ShadSwitchFormField({
    super.id,
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
    ShadDecoration? decoration,
    super.focusNode,
    String? Function(bool)? validator,
    Color? thumbColor,
    Color? uncheckedTrackColor,
    Color? checkedTrackColor,
    double? width,
    double? margin,
    Duration? duration,
    Widget? inputLabel,
    Widget? inputSublabel,
    EdgeInsets? padding,
    TextDirection? direction,

    /// {@macro ShadSwitch.orderPolicy}
    WidgetOrderPolicy? orderPolicy,
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
          decorationBuilder: (context) =>
              (ShadTheme.of(context).switchTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderSwitchState;

            return ShadSwitch(
              value: state.value!,
              onChanged: state.didChange,
              enabled: state.enabled,
              focusNode: state.focusNode,
              decoration: state.decoration,
              duration: duration,
              label: inputLabel,
              sublabel: inputSublabel,
              padding: padding,
              direction: direction,
              width: width,
              margin: margin,
              thumbColor: thumbColor,
              uncheckedTrackColor: uncheckedTrackColor,
              checkedTrackColor: checkedTrackColor,
              orderPolicy: orderPolicy,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadSwitchFormField, bool> createState() =>
      _ShadFormBuilderSwitchState();
}

class _ShadFormBuilderSwitchState
    extends ShadFormBuilderFieldState<ShadSwitchFormField, bool> {}
