import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool value = false;
  bool enabled = true;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Checkbox',
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
        ShadCheckbox(
          value: value,
          focusNode: focusNode,
          onChanged: (v) => setState(() => value = v),
          enabled: enabled,
          label: const Text('Accept terms and conditions'),
          sublabel: const Text(
            'You agree to our Terms of Service and Privacy Policy.',
          ),
        ),
      ],
    );
  }
}
