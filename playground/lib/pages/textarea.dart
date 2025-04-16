import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TextareaPage extends StatelessWidget {
  const TextareaPage({super.key});

  // Example usage of ShadTextarea
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: const ShadTextarea(
            placeholder: Text('Placeholder'),
          ),
        ),
      ),
    );
  }
}
