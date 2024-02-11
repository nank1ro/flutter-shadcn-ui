// ignore_for_file: avoid_print

import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InputFormFieldPage extends StatefulWidget {
  const InputFormFieldPage({super.key});

  @override
  State<InputFormFieldPage> createState() => _InputFormFieldPageState();
}

class _InputFormFieldPageState extends State<InputFormFieldPage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: formKey,
      // initialValue: const {'name': 'Alex'}
      child: BaseScaffold(
        appBarTitle: 'InputFormField',
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadInputFormField(
                  id: 'name',
                  label: const Text('Name'),
                  placeholder: const Text('Enter your name'),
                  description: const Text('This is your public display name.'),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  text: const Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      print('validation passed');
                      print(formKey.currentState!.value);
                    } else {
                      print('validation failed');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
