import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyStringProperty extends StatelessWidget {
  const MyStringProperty({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.placeholder,
  });

  final String label;
  final Widget? placeholder;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        ShadInput(
          initialValue: initialValue,
          onChanged: onChanged,
          placeholder: placeholder,
        )
      ],
    );
  }
}
