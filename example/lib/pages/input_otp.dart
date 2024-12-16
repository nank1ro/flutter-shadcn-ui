import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputOTPPage extends StatefulWidget {
  const InputOTPPage({super.key});

  @override
  State<InputOTPPage> createState() => _InputOTPPageState();
}

class _InputOTPPageState extends State<InputOTPPage> {
  var enabled = true;
  var uppercase = true;
  var digitsOnly = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Input OTP',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Uppercase',
          value: uppercase,
          enabled: !digitsOnly,
          onChanged: (value) => setState(() => uppercase = value),
        ),
        MyBoolProperty(
          label: 'Digits only',
          value: digitsOnly,
          enabled: !uppercase,
          onChanged: (value) => setState(() => digitsOnly = value),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadInputOTP(
            maxLength: 6,
            enabled: enabled,
            keyboardType: digitsOnly ? TextInputType.number : null,
            inputFormatters: [
              if (digitsOnly) FilteringTextInputFormatter.digitsOnly,
              if (uppercase) const UpperCaseTextInputFormatter(),
            ],
            children: const [
              ShadInputOTPGroup(
                children: [
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                ],
              ),
              ShadInputOTPGroup(
                children: [
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                  ShadInputOTPSlot(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
