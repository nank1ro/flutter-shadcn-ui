# Input

Displays a form input field or a component that looks like an input field.



```dart
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 320),
  child: const ShadInput(
    placeholder: Text('Email'),
    keyboardType: TextInputType.emailAddress,
  ),
),
```



## With leading and trailing



```dart
class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      placeholder: const Text('Password'),
      obscureText: obscure,
      leading: Icon(LucideIcons.lock),
      trailing: SizedBox.square(
        dimension: 24,
        child: OverflowBox(
          maxWidth: 28,
          maxHeight: 28,
          child: ShadIconButton(
            iconSize: 20,
            padding: EdgeInsets.all(2),
            icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
            onPressed: () {
              setState(() => obscure = !obscure);
            },
          ),
        ),
      ),
    );
  }
}
```



## Form



```dart
ShadInputFormField(
  id: 'username',
  label: const Text('Username'),
  placeholder: const Text('Enter your username'),
  description:
      const Text('This is your public display name.'),
  validator: (v) {
    if (v.length < 2) {
      return 'Username must be at least 2 characters.';
    }
    return null;
  },
),
```

## Example
```dart
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
          leading: Icon(LucideIcons.lock),
          trailing: SizedBox.square(
            dimension: 24,
            child: OverflowBox(
              maxWidth: 28,
              maxHeight: 28,
              child: ShadIconButton(
                iconSize: 20,
                padding: EdgeInsets.all(2),
                icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
                onPressed: () {
                  setState(() => obscure = !obscure);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

```

## Form Example
```dart
import 'dart:convert';
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputFormFieldPage extends StatefulWidget {
  const InputFormFieldPage({super.key});

  @override
  State<InputFormFieldPage> createState() => _InputFormFieldPageState();
}

class _InputFormFieldPageState extends State<InputFormFieldPage> {
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
      initialValue: {
        if (initialValue != null) 'username': initialValue,
        'profile': {'age': 18},
      },
      child: BaseScaffold(
        appBarTitle: 'InputFormField',
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
            placeholder: const Text('Name'),
            onChanged: (value) {
              formKey.currentState!.setFieldValue('username', value);
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                ShadInputFormField(
                  id: 'username',
                  leading: const Icon(LucideIcons.user),
                  label: const Text('Username'),
                  placeholder: const Text('Enter your username'),
                  description: const Text('This is your public display name.'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'profile.age',
                  fromValueTransformer: (v) => v?.toString(),
                  toValueTransformer: (String? v) => int.tryParse(v ?? ''),
                  keyboardType: TextInputType.number,
                  label: const Text('Age (dot notation)'),
                  placeholder: const Text('Enter your age'),
                  description: const Text(
                    'This field uses dot notation: profile.age',
                  ),
                ),
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
