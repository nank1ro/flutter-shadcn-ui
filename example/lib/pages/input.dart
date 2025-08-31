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
  bool obscure = true;

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
        MyBoolProperty(
          label: 'Obscure',
          value: obscure,
          onChanged: (value) => setState(() => obscure = value),
        ),
      ],
      children: [
        ShadInput(
          placeholder: const Text('Email'),
          enabled: enabled,
          keyboardType: TextInputType.emailAddress,
        ),
        ShadInput(
          placeholder: const Text('Password'),
          enabled: enabled,
          obscureText: obscure,
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(LucideIcons.lock),
          ),
          trailing: ShadIconButton(
            width: 24,
            height: 24,
            padding: EdgeInsets.zero,
            icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
            onPressed: () {
              setState(() => obscure = !obscure);
            },
          ),
        ),
      ],
    );
  }
}
