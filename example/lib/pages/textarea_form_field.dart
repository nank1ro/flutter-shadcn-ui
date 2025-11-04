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
              setState(() {
                value.isEmpty ? initialValue = null : initialValue = value;
              });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                formKey.currentState!.reset();
              });
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
                    ShadToaster.of(context).show(
                      ShadToast(title: Text('Form submitted successfylly')),
                    );
                    if (formKey.currentState!.saveAndValidate()) {
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
