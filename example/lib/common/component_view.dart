import 'package:flutter/material.dart';

class ComponentView extends StatelessWidget {
  const ComponentView({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
      const SizedBox(height: 8),
      child,
    ]);
  }
}
