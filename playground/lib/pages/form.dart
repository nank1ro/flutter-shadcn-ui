// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum FormStyle {
  inputField,
  checkboxField,
  switchField,
  selectField,
  radioField,
}

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

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
    required this.style,
  });

  final FormStyle style;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<ShadFormState>();

  final verifiedEmails = [
    'm@example.com',
    'm@google.com',
    'm@support.com',
  ];

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
                switch (widget.style) {
                  FormStyle.inputField => ShadInputFormField(
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
                  FormStyle.checkboxField => ShadCheckboxFormField(
                      id: 'terms',
                      initialValue: false,
                      inputLabel:
                          const Text('I accept the terms and conditions'),
                      onChanged: (v) {},
                      inputSublabel:
                          const Text('You agree to our Terms and Conditions'),
                      validator: (v) {
                        if (!v) {
                          return 'You must accept the terms and conditions';
                        }
                        return null;
                      },
                    ),
                  FormStyle.switchField => ShadSwitchFormField(
                      id: 'terms',
                      initialValue: false,
                      inputLabel:
                          const Text('I accept the terms and conditions'),
                      onChanged: (v) {},
                      inputSublabel:
                          const Text('You agree to our Terms and Conditions'),
                      validator: (v) {
                        if (!v) {
                          return 'You must accept the terms and conditions';
                        }
                        return null;
                      },
                    ),
                  FormStyle.selectField => ShadSelectFormField<String>(
                      id: 'email',
                      minWidth: 350,
                      initialValue: null,
                      onChanged: (v) {},
                      options: verifiedEmails
                          .map((email) =>
                              ShadOption(value: email, child: Text(email)))
                          .toList(),
                      selectedOptionBuilder: (context, value) => value == 'none'
                          ? const Text('Select a verified email to display')
                          : Text(value),
                      placeholder:
                          const Text('Select a verified email to display'),
                      validator: (v) {
                        if (v == null) {
                          return 'Please select an email to display';
                        }
                        return null;
                      },
                    ),
                  FormStyle.radioField => ShadRadioGroupFormField<NotifyAbout>(
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
                },
                const SizedBox(height: 16),
                ShadButton(
                  child: const Text('Submit'),
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
