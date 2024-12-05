import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputOTPPage extends StatefulWidget {
  const InputOTPPage({super.key});

  @override
  State<InputOTPPage> createState() => _InputOTPPageState();
}

class _InputOTPPageState extends State<InputOTPPage> {
  var enabled = true;

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
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadInputOTP(
            maxLength: 6,
            enabled: enabled,
            children: const [
              ShadInputOTPGroup(children: [
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
              ]),
              ShadInputOTPGroup(children: [
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
                ShadInputOTPSlot(),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
