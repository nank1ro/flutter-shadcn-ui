import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum PlagroundButtonStyle {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  link,
  icon,
  textIcon,
  loading,
  gradientShadow,
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key, required this.style});

  final PlagroundButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (style) {
          PlagroundButtonStyle.primary => ShadButton(
              child: const Text('Primary'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.secondary => ShadButton.secondary(
              child: const Text('Secondary'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.destructive => ShadButton.destructive(
              child: const Text('Destructive'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.outline => ShadButton.outline(
              child: const Text('Outline'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.ghost => ShadButton.ghost(
              child: const Text('Ghost'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.link => ShadButton.link(
              child: const Text('Link'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.icon => ShadButton.outline(
              icon: const ShadImage(LucideIcons.chevronRight),
              onPressed: () {},
            ),
          PlagroundButtonStyle.textIcon => ShadButton(
              onPressed: () {},
              icon: const ShadImage(LucideIcons.mail),
              child: const Text('Login with Email'),
            ),
          PlagroundButtonStyle.loading => ShadButton(
              onPressed: () {},
              icon: const CircularProgressIndicator(strokeWidth: 2),
              child: const Text('Please wait'),
            ),
          PlagroundButtonStyle.gradientShadow => ShadButton(
              onPressed: () {},
              gradient: const LinearGradient(colors: [
                Colors.cyan,
                Colors.indigo,
              ]),
              shadows: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: .4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              child: const Text('Gradient with Shadow'),
            ),
        },
      ),
    );
  }
}
