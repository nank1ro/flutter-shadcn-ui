// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'username',
                  label: const Text('Username'),
                  placeholder: const Text('Enter your username'),
                  description: const Text('This is your public display name.'),
                  validator: (v) {
                    if ((v ?? '').length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ShadButton(
                  text: const Text('Submit'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      print(
                          'validation succeeded with ${formKey.currentState!.value}');
                    } else {
                      print('validation failed');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
