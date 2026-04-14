# Date Picker

A date picker component with range and presets.



```dart
class SingleDatePicker extends StatelessWidget {
  const SingleDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadDatePicker(),
    );
  }
}
```



## Date Range Picker



```dart
class RangeDatePicker extends StatelessWidget {
  const RangeDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const ShadDatePicker.range(),
    );
  }
}
```



## With Presets



```dart
const presets = {
  0: 'Today',
  1: 'Tomorrow',
  3: 'In 3 days',
  7: 'In a week',
};

class PresetsDatePicker extends StatefulWidget {
  const PresetsDatePicker({super.key});

  @override
  State<PresetsDatePicker> createState() => _PresetsDatePickerState();
}

class _PresetsDatePickerState extends State<PresetsDatePicker> {
  final groupId = UniqueKey();
  final today = DateTime.now().startOfDay;
  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: ShadDatePicker(
        // Using the same groupId to keep the date picker popover open when the
        // select popover is closed.
        groupId: groupId,
        header: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: ShadSelect<int>(
            groupId: groupId,
            minWidth: 276,
            placeholder: const Text('Select'),
            options: presets.entries
                .map((e) => ShadOption(value: e.key, child: Text(e.value)))
                .toList(),
            selectedOptionBuilder: (context, value) {
              return Text(presets[value]!);
            },
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                selected = today.add(Duration(days: value));
              });
            },
          ),
        ),
        selected: selected,
        calendarDecoration: theme.calendarTheme.decoration,
        popoverPadding: const EdgeInsets.all(4),
      ),
    );
  }
}
```



## Form



```dart
ShadDatePickerFormField(
  label: const Text('Date of birth'),
  onChanged: print,
  description: const Text(
      'Your date of birth is used to calculate your age.'),
  validator: (v) {
    if (v == null) {
      return 'A date of birth is required.';
    }
    return null;
  },
),
```



## DateRangePickerFormField



```dart
ShadDateRangePickerFormField(
  label: const Text('Range of dates'),
  onChanged: print,
  description: const Text(
      'Select the range of dates you want to search between.'),
  validator: (v) {
    if (v == null) return 'A range of dates is required.';
    if (v.start == null) {
      return 'The start date is required.';
    }
    if (v.end == null) return 'The end date is required.';

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

const presets = {
  0: 'Today',
  1: 'Tomorrow',
  3: 'In 3 days',
  7: 'In a week',
};

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({super.key});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  bool closeOnSelection = false;
  bool allowDeselection = true;
  final today = DateTime.now().startOfDay;
  final groupId = UniqueKey();

  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'DatePicker',
      editable: [
        MyBoolProperty(
          label: 'closeOnSelection',
          value: closeOnSelection,
          onChanged: (value) => setState(() => closeOnSelection = value),
        ),
        MyBoolProperty(
          label: 'allowDeselection',
          value: allowDeselection,
          onChanged: (value) => setState(() => allowDeselection = value),
        ),
      ],
      children: [
        Text('Single', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker(
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
          ),
        ),
        const ShadSeparator.horizontal(),
        Text('Range', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker.range(
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
          ),
        ),
        const ShadSeparator.horizontal(),
        Text('With Presets', style: theme.textTheme.h4),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadDatePicker(
            // Using the same groupId to keep the date picker popover open when the
            // select popover is closed.
            groupId: groupId,
            header: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: ShadSelect<int>(
                groupId: groupId,
                minWidth: 276,
                placeholder: const Text('Select'),
                options: presets.entries
                    .map((e) => ShadOption(value: e.key, child: Text(e.value)))
                    .toList(),
                selectedOptionBuilder: (context, value) {
                  return Text(presets[value]!);
                },
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    selected = today.add(Duration(days: value));
                  });
                },
              ),
            ),
            closeOnSelection: closeOnSelection,
            allowDeselection: allowDeselection,
            selected: selected,
            calendarDecoration: theme.calendarTheme.decoration,
            popoverPadding: const EdgeInsets.all(4),
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

class DatePickerFormFieldPage extends StatefulWidget {
  const DatePickerFormFieldPage({super.key});

  @override
  State<DatePickerFormFieldPage> createState() =>
      _DatePickerFormFieldPageState();
}

class _DatePickerFormFieldPageState extends State<DatePickerFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      child: BaseScaffold(
        appBarTitle: 'DatePickerFormField',
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
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Single', style: theme.textTheme.h4),
                ShadDatePickerFormField(
                  id: 'date',
                  label: const Text('Date of birth'),
                  onChanged: print,
                  description: const Text(
                    'Your date of birth is used to calculate your age.',
                  ),
                  validator: (v) {
                    if (v == null) {
                      return 'A date of birth is required.';
                    }
                    return null;
                  },
                ),
                const ShadSeparator.horizontal(),
                Text('Range', style: theme.textTheme.h4),
                ShadDateRangePickerFormField(
                  id: 'range-date',
                  label: const Text('Range of dates'),
                  onChanged: print,
                  description: const Text(
                    'Select the range of dates you want to search between.',
                  ),
                  validator: (v) {
                    if (v == null) return 'A range of dates is required.';
                    if (v.start == null) return 'The start date is required.';
                    if (v.end == null) return 'The end date is required.';

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
