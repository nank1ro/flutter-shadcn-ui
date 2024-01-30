import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyBoolProperty extends StatelessWidget {
  const MyBoolProperty({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 8),
        ShadSwitch(value: value, onChanged: onChanged)
      ],
    );
  }
}
