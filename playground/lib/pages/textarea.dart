import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A demo page showcasing the usage of [ShadTextarea] with controls
/// to toggle `enabled` and `resizable` states dynamically.
class TextareaPage extends StatefulWidget {
  const TextareaPage({super.key});

  @override
  State<TextareaPage> createState() => _TextareaPageState();
}

class _TextareaPageState extends State<TextareaPage> {
  final bool _enabled = true;
  final bool _resizable = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadTextarea(
                controller: _controller,
                placeholder: const Text('Placeholder'),
                enabled: _enabled,
                resizable: _resizable,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
