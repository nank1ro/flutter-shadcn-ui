// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
            values: AutovalidateMode.values,
            onChanged: (value) => setState(() => autovalidateMode = value),
          ),
          MyEnumProperty<NotifyAbout>(
            label: 'Form Initial Value',
            value: NotifyAbout.nothing,
            values: NotifyAbout.values,
            onChanged: (value) {
              setState(() {
                initialValue = value;
              });
              // Reset the form
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                formKey.currentState!.reset();
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
                ShadRadioGroupFormField(
                  id: 'notify',
                  enabled: enabled,
                  initialValue: initialValue,
                  valueTransformer: (value) => value?.name,
                  items: NotifyAbout.values
                      .map(
                        (e) => ShadRadio(
                          value: e,
                          label: Text(e.message),
                        ),
                      )
                      .separatedBy(const SizedBox(height: 4)),
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
                  text: const Text('Submit'),
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
