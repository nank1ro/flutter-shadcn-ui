import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RadioGroupPage extends StatelessWidget {
  const RadioGroupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadRadioGroup<String>(
          items: const [
            ShadRadio(
              label: Text('Default'),
              value: 'default',
            ),
            ShadRadio(
              label: Text('Comfortable'),
              value: 'comfortable',
            ),
            ShadRadio(
              label: Text('Nothing'),
              value: 'nothing',
            ),
          ].separatedBy(const SizedBox(height: 4)),
        ),
      ),
    );
  }
}
