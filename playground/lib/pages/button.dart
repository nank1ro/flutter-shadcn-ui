import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key, required this.variant});

  final ShadcnButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: () {
          return switch (variant) {
            ShadcnButtonVariant.$default => ShadcnButton(
                text: const Text('Primary'),
                onPressed: () {},
              ),
            ShadcnButtonVariant.secondary => ShadcnButton.secondary(
                text: const Text('Secondary'),
                onPressed: () {},
              ),
            ShadcnButtonVariant.destructive => ShadcnButton.destructive(
                text: const Text('Destructive'),
                onPressed: () {},
              ),
            ShadcnButtonVariant.outline => ShadcnButton.outline(
                text: const Text('Outline'),
                onPressed: () {},
              ),
            ShadcnButtonVariant.ghost => ShadcnButton.ghost(
                text: const Text('Ghost'),
                onPressed: () {},
              ),
            ShadcnButtonVariant.link => ShadcnButton.link(
                text: const Text('Link'),
                onPressed: () {},
              ),
          };
        }(),
      ),
    );
  }
}
