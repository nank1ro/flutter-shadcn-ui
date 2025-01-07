import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/checkbox.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

class ShadCheckboxFormField extends ShadFormBuilderField<bool> {
  ShadCheckboxFormField({
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
    super.focusNode,
    ShadDecoration? decoration,
    String? Function(bool)? validator,
    double? size,
    Duration? duration,
    Widget? icon,
    Color? color,
    Widget? inputLabel,
    Widget? inputSublabel,
    EdgeInsets? padding,
    TextDirection? direction,

    /// {@macro ShadCheckbox.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ShadCheckbox.orderPolicy}
    WidgetOrderPolicy? orderPolicy,
  }) : super(
          initialValue: initialValue,
          onChanged: onChanged == null ? null : (v) => onChanged(v ?? false),
          validator: validator == null ? null : (v) => validator(v ?? false),
          decorationBuilder: (context) =>
              (ShadTheme.of(context).checkboxTheme.decoration ??
                      const ShadDecoration())
                  .mergeWith(decoration),
          builder: (field) {
            final state = field as _ShadFormBuilderCheckboxState;
            return ShadCheckbox(
              value: state.value!,
              onChanged: state.didChange,
              enabled: state.enabled,
              focusNode: state.focusNode,
              size: size,
              duration: duration,
              icon: icon,
              color: color,
              label: inputLabel,
              sublabel: inputSublabel,
              padding: padding,
              direction: direction,
              decoration: state.decoration,
              crossAxisAlignment: crossAxisAlignment,
              orderPolicy: orderPolicy,
            );
          },
        );

  @override
  ShadFormBuilderFieldState<ShadCheckboxFormField, bool> createState() =>
      _ShadFormBuilderCheckboxState();
}

class _ShadFormBuilderCheckboxState
    extends ShadFormBuilderFieldState<ShadCheckboxFormField, bool> {}
