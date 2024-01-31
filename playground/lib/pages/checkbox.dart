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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadCheckbox(
              value: value,
              onChanged: (v) => setState(() => value = v),
            ),
            const SizedBox(width: 8),
            Text(
              'Accept terms and conditions',
              style: ShadTheme.of(context).textTheme.small,
            ),
          ],
        ),
      ),
    );
  }
}
