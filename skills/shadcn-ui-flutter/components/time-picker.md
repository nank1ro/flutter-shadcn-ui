# Time Picker

A time picker component.



```dart
class PrimaryTimePicker extends StatelessWidget {
  const PrimaryTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadTimePicker(
        trailing: Padding(
          padding: EdgeInsets.only(left: 8, top: 14),
          child: Icon(LucideIcons.clock4),
        ),
      ),
    );
  }
}
```



## Form



```dart
ShadTimePickerFormField(
  label: const Text('Pick a time'),
  onChanged: print,
  description:
      const Text('The time of the day you want to pick'),
  validator: (v) => v == null ? 'A time is required' : null,
)
```



## ShadTimePickerFormField.period



```dart
ShadTimePickerFormField.period(
  label: const Text('Pick a time'),
  onChanged: print,
  description:
      const Text('The time of the day you want to pick'),
  validator: (v) => v == null ? 'A time is required' : null,
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  bool showHours = true;
  bool showMinutes = true;
  bool showSeconds = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'TimePicker',
      editable: [
        MyBoolProperty(
          label: ' Show Hours',
          value: showHours,
          enabled: showMinutes || showSeconds,
          onChanged: (v) => setState(() => showHours = v),
        ),
        MyBoolProperty(
          label: ' Show Minutes',
          value: showMinutes,
          enabled: showHours || showSeconds,
          onChanged: (v) => setState(() => showMinutes = v),
        ),
        MyBoolProperty(
          label: ' Show Seconds',
          enabled: showHours || showMinutes,
          value: showSeconds,
          onChanged: (v) => setState(() => showSeconds = v),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadTimePicker(
            showHours: showHours,
            showMinutes: showMinutes,
            showSeconds: showSeconds,
            trailing: const Padding(
              padding: EdgeInsets.only(left: 8, top: 14),
              child: Icon(LucideIcons.clock4),
            ),
            onChanged: (time) {
              print('time: $time');
            },
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadTimePicker.period(
            showHours: showHours,
            showMinutes: showMinutes,
            showSeconds: showSeconds,
            crossAxisAlignment: WrapCrossAlignment.end,
            onChanged: (time) {
              print('time: $time');
            },
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

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TimePickerFormFieldPage extends StatefulWidget {
  const TimePickerFormFieldPage({super.key});

  @override
  State<TimePickerFormFieldPage> createState() =>
      _TimePickerFormFieldPageState();
}

class _TimePickerFormFieldPageState extends State<TimePickerFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();
  bool showHours = true;
  bool showMinutes = true;
  bool showSeconds = true;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      child: BaseScaffold(
        appBarTitle: 'TimePickerFormField',
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
            label: ' Show Hours',
            value: showHours,
            enabled: showMinutes || showSeconds,
            onChanged: (v) => setState(() => showHours = v),
          ),
          MyBoolProperty(
            label: ' Show Minutes',
            value: showMinutes,
            enabled: showHours || showSeconds,
            onChanged: (v) => setState(() => showMinutes = v),
          ),
          MyBoolProperty(
            label: ' Show Seconds',
            enabled: showHours || showMinutes,
            value: showSeconds,
            onChanged: (v) => setState(() => showSeconds = v),
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadTimePickerFormField(
                  id: 'time',
                  showHours: showHours,
                  showMinutes: showMinutes,
                  showSeconds: showSeconds,
                  label: const Text('Pick a time'),
                  onChanged: print,
                  description: const Text(
                    'The time of the day you want to pick',
                  ),
                  validator: (v) => v == null ? 'A time is required' : null,
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
                          formValue.toString(),
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
