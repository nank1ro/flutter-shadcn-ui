# Switch

A control that allows the user to toggle between checked and not checked.



```dart
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadSwitch(
      value: value,
      onChanged: (v) => setState(() => value = v),
      label: const Text('Airplane Mode'),
    );
  }
}
```



## Form



```dart
ShadSwitchFormField(
  id: 'terms',
  initialValue: false,
  inputLabel:
      const Text('I accept the terms and conditions'),
  onChanged: (v) {},
  inputSublabel:
      const Text('You agree to our Terms and Conditions'),
  validator: (v) {
    if (!v) {
      return 'You must accept the terms and conditions';
    }
    return null;
  },
)
```

## Example
```dart
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
          enabled: enabled,
          onChanged: (v) {
            setState(() => value = v);
          },
          label: const Text('Airplane Mode'),
        ),
      ],
    );
  }
}

```

## Form Example
```dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SwitchFormFieldPage extends StatefulWidget {
  const SwitchFormFieldPage({super.key});

  @override
  State<SwitchFormFieldPage> createState() => _SwitchFormFieldPageState();
}

class _SwitchFormFieldPageState extends State<SwitchFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  bool initialValue = false;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'terms': initialValue},
      child: BaseScaffold(
        appBarTitle: 'SwitchFormField',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
          MyEnumProperty(
            label: 'autovalidateMode',
            value: autovalidateMode,
            values: ShadAutovalidateMode.values,
            onChanged: (value) {
              if (value != null) {
                setState(() => autovalidateMode = value);
              }
            },
          ),
          MyBoolProperty(
            label: 'Form Initial Value',
            value: initialValue,
            onChanged: (value) {
              formKey.currentState!.setFieldValue('terms', value);
              setState(() {
                initialValue = value;
              });
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadSwitchFormField(
                  id: 'terms',
                  initialValue: initialValue,
                  inputLabel: const Text('I accept the terms and conditions'),
                  onChanged: (v) {},
                  inputSublabel: const Text(
                    'You agree to our Terms and Conditions',
                  ),
                  validator: (v) {
                    if (!v) {
                      return 'You must accept the terms and conditions';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print('submitted');
                    if (formKey.currentState!.saveAndValidate()) {
                      setState(() {
                        formValue = formKey.currentState!.value;
                      });
                    } else {
                      print('validation failed');
                    }
                  },
                ),
                if (formValue.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FormValue', style: theme.textTheme.p),
                        const SizedBox(height: 4),
                        SelectableText(
                          const JsonEncoder.withIndent(
                            '    ',
                          ).convert(formValue),
                          style: theme.textTheme.small,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

```
