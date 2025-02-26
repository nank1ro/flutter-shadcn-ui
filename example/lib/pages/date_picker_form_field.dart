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
  DateTime? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'date': initialValue},
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
                  initialValue: initialValue,
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
                const ShadDivider.horizontal(),
                Text('Range', style: theme.textTheme.h4),
                ShadDateRangePickerFormField(
                  id: 'range-date',
                  label: const Text('Range of dates'),
                  onChanged: print,
                  description: const Text(
                      'Select the range of dates you want to search between.'),
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
