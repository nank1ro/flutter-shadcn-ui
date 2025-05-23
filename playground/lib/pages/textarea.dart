import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A demo page showcasing the usage of [ShadTextarea] with controls
/// to toggle `enabled` and `resizable` states dynamically.
class TextareaPage extends StatelessWidget {
  const TextareaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const ShadTextarea(
            placeholder: Text('Type your message here'),
          ),
        ),
      ),
    );
  }
}
