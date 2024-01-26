import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Select',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 180),
          child: ShadcnSelect(
            enabled: enabled,
            placeholder: const Text('Select a fruit'),
            options: const [
              ShadcnOption(value: 'Apple', child: Text('Apple')),
              ShadcnOption(value: 'Banana', child: Text('Banana')),
              ShadcnOption(value: 'Blueberry', child: Text('Blueberry')),
              ShadcnOption(value: 'Grapes', child: Text('Grapes')),
              ShadcnOption(value: 'Pineapple', child: Text('Pineapple')),
            ],
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
      ],
    );
  }
}
