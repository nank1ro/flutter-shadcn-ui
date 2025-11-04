import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/form/field.dart';
import 'package:shadcn_ui/src/components/input_otp.dart';

class ShadInputOTPFormField extends ShadFormBuilderField<String> {
  ShadInputOTPFormField({
    super.id,
    super.key,
    super.onSaved,
    super.forceErrorText,

    /// {@macro ShadFormBuilderField.validator}
    String? Function(String)? validator,

    /// {@macro ShadInputOTP.initialValue}
    super.initialValue,

    /// {@macro ShadInputOTP.enabled}
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.label,
    super.error,
    super.description,

    /// {@macro ShadInputOTP.onChanged}
    void Function(String)? onChanged,
    super.valueTransformer,
    super.onReset,
    super.readOnly,

    /// {@macro ShadInputOTP.maxLength}
    required int maxLength,

    /// {@macro ShadInputOTP.gap}
    double? gap,

    /// {@macro ShadInputOTP.children}
    required List<Widget> children,

    /// {@macro ShadInputOTP.jumpToNextWhenFilled}
    bool jumpToNextWhenFilled = true,

    /// {@macro ShadInputOTP.inputFormatters}
    List<TextInputFormatter>? inputFormatters,

    /// {@macro ShadInputOTP.keyboardType}
    TextInputType? keyboardType,
  }) : super(
         validator: validator == null
             ? null
             : (v) => validator(v ?? ''.padRight(maxLength)),
         onChanged: onChanged == null
             ? null
             : (v) => onChanged(v ?? ''.padRight(maxLength)),
         builder: (field) {
           final state =
               field
                   as ShadFormBuilderFieldState<
                     ShadFormBuilderField<String>,
                     String
                   >;
           return ShadInputOTP(
             enabled: state.enabled,
             keyboardType: keyboardType,
             inputFormatters: inputFormatters,
             gap: gap,
             maxLength: maxLength,
             jumpToNextWhenFilled: jumpToNextWhenFilled,
             onChanged: state.didChange,
             initialValue: state.initialValue,
             children: children,
           );
         },
       );
}
