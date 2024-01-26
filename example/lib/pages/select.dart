import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Select',
      children: [
        ShadcnSelect(
          placeholder: const Text('Select a fruit'),
          options: const [
            ShadcnOption(value: 'apple', child: Text('Apple')),
            ShadcnOption(value: 'banana', child: Text('Banana')),
            ShadcnOption(value: 'blueberry', child: Text('Blueberry')),
            ShadcnOption(value: 'grapes', child: Text('Grapes')),
            ShadcnOption(value: 'pineapple', child: Text('Pineapple')),
          ],
          selectedOptionBuilder: (context, value) => Text(value),
        ),
      ],
    );
  }
}
