import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RadioGroupPage extends StatelessWidget {
  const RadioGroupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ShadRadioGroup<String>(
          items: [
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
          ],
        ),
      ),
    );
  }
}
