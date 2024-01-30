import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Input',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
      ],
      children: [
        ShadcnInput(
          placeholder: 'Email',
          enabled: enabled,
        ),
      ],
    );
  }
}
