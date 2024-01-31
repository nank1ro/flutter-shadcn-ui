import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool value = false;
  bool enabled = true;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Switch',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Focused',
          value: focusNode.hasFocus,
          onChanged: enabled
              ? (value) {
                  setState(() {
                    if (value) {
                      focusNode.requestFocus();
                    } else {
                      focusNode.unfocus();
                    }
                  });
                }
              : null,
        ),
      ],
      children: [
        ShadSwitch(
          value: value,
          focusNode: focusNode,
          onChanged: enabled
              ? (v) {
                  setState(() => value = v);
                }
              : null,
          label: const Text('Airplane Mode'),
        ),
      ],
    );
  }
}
