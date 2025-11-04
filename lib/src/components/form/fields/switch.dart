import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSwitchFormField extends ShadFormBuilderField<bool> {
  ShadSwitchFormField({
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

    /// {@macro ShadFormBuilderField.initialValue}
    required bool initialValue,

    /// {@macro ShadSwitch.decoration}
    ShadDecoration? decoration,
    super.focusNode,

    /// {@macro ShadFormBuilderField.validator}
    String? Function(bool)? validator,

    /// {@macro ShadSwitch.thumbColor}
    Color? thumbColor,

    /// {@macro ShadSwitch.uncheckedTrackColor}
    Color? uncheckedTrackColor,

    /// {@macro ShadSwitch.checkedTrackColor}
    Color? checkedTrackColor,

    /// {@macro ShadSwitch.width}
    double? width,

    /// {@macro ShadSwitch.margin}
    double? margin,

    /// {@macro ShadSwitch.duration}
    Duration? duration,

    /// {@macro ShadSwitch.inputLabel}
    Widget? inputLabel,

    /// {@macro ShadSwitch.inputSublabel}
    Widget? inputSublabel,

    /// {@macro ShadSwitch.padding}
    EdgeInsetsGeometry? padding,

    /// {@macro ShadSwitch.direction}
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
         decorationBuilder: (context) =>
             (ShadTheme.of(context).switchTheme.decoration ??
                     const ShadDecoration())
                 .merge(decoration),
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
           );
         },
       );

  @override
  ShadFormBuilderFieldState<ShadSwitchFormField, bool> createState() =>
      _ShadFormBuilderSwitchState();
}

class _ShadFormBuilderSwitchState
    extends ShadFormBuilderFieldState<ShadSwitchFormField, bool> {}
