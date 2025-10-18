import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/checkbox.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadCheckboxFormField extends ShadFormBuilderField<bool> {
  ShadCheckboxFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,
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

    /// {@macro ShadCheckbox.decoration}
    ShadDecoration? decoration,

    /// {@macro ShadFormBuilderField.validator}
    String? Function(bool)? validator,

    /// {@macro ShadCheckbox.size}
    double? size,

    /// {@macro ShadCheckbox.duration}
    Duration? duration,

    /// {@macro ShadCheckbox.icon}
    Widget? icon,

    /// {@macro ShadCheckbox.color}
    Color? color,

    /// {@macro ShadCheckbox.inputLabel}
    Widget? inputLabel,

    /// {@macro ShadCheckbox.inputSublabel}
    Widget? inputSublabel,

    /// {@macro ShadCheckbox.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ShadCheckbox.direction}
    TextDirection? direction,

    /// {@macro ShadCheckbox.crossAxisAlignment}
    CrossAxisAlignment? crossAxisAlignment,

    /// {@macro ShadCheckbox.checkboxPadding}
    EdgeInsetsGeometry? checkboxPadding,
  }) : super(
         initialValue: initialValue,
         onChanged: onChanged == null ? null : (v) => onChanged(v ?? false),
         validator: validator == null ? null : (v) => validator(v ?? false),
         decorationBuilder: (context) =>
             (ShadTheme.of(context).checkboxTheme.decoration ??
                     const ShadDecoration())
                 .merge(decoration),
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
             checkboxPadding: checkboxPadding,
           );
         },
       );

  @override
  ShadFormBuilderFieldState<ShadCheckboxFormField, bool> createState() =>
      _ShadFormBuilderCheckboxState();
}

class _ShadFormBuilderCheckboxState
    extends ShadFormBuilderFieldState<ShadCheckboxFormField, bool> {}
