# Checkbox

A control that allows the user to toggle between checked and not checked.



```dart
class CheckboxSample extends StatefulWidget {
  const CheckboxSample({super.key});

  @override
  State<CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<CheckboxSample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadCheckbox(
      value: value,
      onChanged: (v) => setState(() => value = v),
      label: const Text('Accept terms and conditions'),
      sublabel: const Text(
        'You agree to our Terms of Service and Privacy Policy.',
      ),
    );
  }
}
```



## Form



```dart
ShadCheckboxFormField(
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

class CheckboxFormFieldPage extends StatefulWidget {
  const CheckboxFormFieldPage({super.key});

  @override
  State<CheckboxFormFieldPage> createState() => _CheckboxFormFieldPageState();
}

class _CheckboxFormFieldPageState extends State<CheckboxFormFieldPage> {
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
        appBarTitle: 'CheckboxFormField',
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
                ShadCheckboxFormField(
                  id: 'terms',
                  initialValue: initialValue,
                  inputLabel: const Text('I accept the terms and conditions'),
                  onChanged: print,
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
