# Textarea

Displays a form textarea or a component that looks like a textarea.



```dart
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 400),
  child: const ShadTextarea(
    placeholder: Text('Type your message here'),
  ),
),
```



## Form



```dart
ShadTextareaFormField(
  id: 'bio',
  label: const Text('Bio'),
  placeholder:
      const Text('Tell us a little bit about yourself'),
  description: const Text(
      'You can @mention other users and organizations.'),
  validator: (v) {
    if (v.length < 10) {
      return 'Bio must be at least 10 characters.';
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
import 'package:shadcn_ui/shadcn_ui.dart';

class TextareaPage extends StatefulWidget {
  const TextareaPage({super.key});

  @override
  State<TextareaPage> createState() => _TextareaPageState();
}

class _TextareaPageState extends State<TextareaPage> {
  bool enabled = true;
  bool resizable = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Textarea',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (v) => setState(() => enabled = v),
        ),
        MyBoolProperty(
          label: 'Resizable',
          value: resizable,
          onChanged: (v) => setState(() => resizable = v),
        ),
      ],
      children: [
        ShadTextarea(
          placeholder: const Text('Type your message here...'),
          enabled: enabled,
          resizable: resizable,
          onChanged: (v) => print('Value changed: $v'),
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
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TextareaFormFieldPage extends StatefulWidget {
  const TextareaFormFieldPage({super.key});

  @override
  State<TextareaFormFieldPage> createState() => _TextareaFormFieldPageState();
}

class _TextareaFormFieldPageState extends State<TextareaFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  String? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {if (initialValue != null) 'bio': initialValue},
      child: BaseScaffold(
        appBarTitle: 'TextareaFormField',
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
          MyStringProperty(
            label: 'Form Initial Value',
            initialValue: initialValue,
            placeholder: const Text('Enter your bio...'),
            onChanged: (value) {
              formKey.currentState!.setFieldValue('bio', value);
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadTextareaFormField(
                  id: 'bio',
                  label: const Text('Bio'),
                  placeholder: const Text('Tell us about yourself...'),
                  minHeight: 100,
                  maxHeight: 250,
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Bio cannot be empty.';
                    if (v.length < 10) {
                      return 'Bio must be at least 10 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      ShadToaster.of(context).show(
                        ShadToast(title: Text('Form submitted successfully')),
                      );
                      setState(() {
                        formValue = formKey.currentState!.value;
                      });
                    } else {
                      ShadToaster.of(context).show(
                        ShadToast.destructive(
                          title: Text('Please correct the errors in the form'),
                        ),
                      );
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
