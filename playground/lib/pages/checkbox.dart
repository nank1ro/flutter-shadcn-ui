import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({
    super.key,
  });

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadCheckbox(
          value: value,
          onChanged: (v) => setState(() => value = v),
          label: const Text('Accept terms and conditions'),
          sublabel: const Text(
            'You agree to our Terms of Service and Privacy Policy.',
          ),
        ),
      ),
    );
  }
}
