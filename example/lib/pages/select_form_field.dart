// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectFormFieldPage extends StatefulWidget {
  const SelectFormFieldPage({super.key});

  @override
  State<SelectFormFieldPage> createState() => _SelectFormFieldPageState();
}

class _SelectFormFieldPageState extends State<SelectFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = ShadAutovalidateMode.alwaysAfterFirstValidation;
  final verifiedEmails = [
    'm@example.com',
    'm@google.com',
    'm@support.com',
  ];
  String? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<ShadFormState>();
  bool allowDeselection = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'email': initialValue},
      child: BaseScaffold(
        appBarTitle: 'SelectFormField',
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
            onChanged: (value) => setState(() => autovalidateMode = value),
          ),
          ShadSelect(
            options: ['none', ...verifiedEmails].map(
              (e) => ShadOption(value: e, child: Text(e.toString())),
            ),
            initialValue: initialValue,
            placeholder: const Text('Form Initial Value'),
            onChanged: (v) {
              setState(() => initialValue = v);
              // Reset the form
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                formKey.currentState!.reset();
              });
            },
            selectedOptionBuilder: (context, value) => Text(
              value.toString(),
            ),
          ),
          MyBoolProperty(
            label: 'Allow deselection',
            value: allowDeselection,
            onChanged: (value) => setState(() => allowDeselection = value),
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadSelectFormField(
                  id: 'email',
                  minWidth: 350,
                  initialValue: initialValue,
                  onChanged: allowDeselection ? null : print,
                  onChangedNullable: allowDeselection ? print : null,
                  options: verifiedEmails
                      .map((email) =>
                          ShadOption(value: email, child: Text(email)))
                      .toList(),
                  selectedOptionBuilder: (context, value) => value == 'none'
                      ? const Text('Select a verified email to display')
                      : Text(value),
                  placeholder: const Text('Select a verified email to display'),
                  validator: (v) {
                    if (v == null) {
                      return 'Please select an email to display';
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
                          const JsonEncoder.withIndent('    ')
                              .convert(formValue),
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
