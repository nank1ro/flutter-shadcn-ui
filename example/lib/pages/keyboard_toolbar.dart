import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KeyboardToolbarPage extends StatelessWidget {
  const KeyboardToolbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'KeyboardToolbar',
      children: [
        ShadInput(
          placeholder: const Text(
            'Focus on mobile to show keyboard and toolbar',
          ),
          keyboardType: TextInputType.emailAddress,
          keyboardToolbarBuilder: (context) => ShadDefaultKeyboardToolbar(),
        ),
        ShadInput(
          placeholder: const Text(
            'Without toolbar, just to show how the chevron works',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
