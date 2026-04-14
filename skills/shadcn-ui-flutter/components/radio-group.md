# RadioGroup

A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.



```dart
ShadRadioGroup<String>(
  items: [
    ShadRadio(
      label: Text('Default'),
      value: 'default',
    ),
    ShadRadio(
      label: Text('Comfortable'),
      value: 'comfortable',
    ),
    ShadRadio(
      label: Text('Nothing'),
      value: 'nothing',
    ),
  ],
),
```



## Form



```dart
enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

ShadRadioGroupFormField<NotifyAbout>(
  label: const Text('Notify me about'),
  items: NotifyAbout.values.map(
    (e) => ShadRadio(
      value: e,
      label: Text(e.message),
    ),
  ),
  validator: (v) {
    if (v == null) {
      return 'You need to select a notification type.';
    }
    return null;
  },
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  NotifyAbout? value;
  bool enabled = true;
  Axis axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'RadioGroup',
      crossAxisAlignment: CrossAxisAlignment.start,
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyEnumProperty(
          label: 'Axis',
          value: axis,
          onChanged: (value) {
            if (value != null) {
              setState(() => axis = value);
            }
          },
          values: Axis.values,
        ),
      ],
      children: [
        ShadRadioGroup<NotifyAbout>(
          enabled: enabled,
          initialValue: value,
          onChanged: (v) {
            print('onChange $v');
          },
          axis: axis,
          items: NotifyAbout.values.map(
            (e) => ShadRadio(
              value: e,
              label: Text(e.message),
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
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

class RadioGroupFormFieldPage extends StatefulWidget {
  const RadioGroupFormFieldPage({super.key});

  @override
  State<RadioGroupFormFieldPage> createState() =>
      _RadioGroupFormFieldPageState();
}

class _RadioGroupFormFieldPageState extends State<RadioGroupFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  NotifyAbout? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'notify': initialValue},
      child: BaseScaffold(
        appBarTitle: 'RadioGroupFormField',
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
          MyEnumProperty<NotifyAbout>(
            label: 'Form Initial Value',
            value: NotifyAbout.nothing,
            values: NotifyAbout.values,
            onChanged: (value) {
              formKey.currentState!.setFieldValue('notify', value);
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadRadioGroupFormField(
                  id: 'notify',
                  enabled: enabled,
                  initialValue: initialValue,
                  toValueTransformer: (value) => value?.name,
                  items: NotifyAbout.values.map(
                    (e) => ShadRadio(
                      value: e,
                      label: Text(e.message),
                    ),
                  ),
                  label: const Text('Notify me about'),
                  validator: (v) {
                    if (v == null) {
                      return 'You need to select a notification type.';
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
