import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum PlagroundIconButtonStyle {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  loading,
  gradientShadow,
}

class IconButtonPage extends StatelessWidget {
  const IconButtonPage({super.key, required this.style});

  final PlagroundIconButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (style) {
          PlagroundIconButtonStyle.primary => ShadIconButton(
            onPressed: () => print('Primary'),
            icon: const Icon(LucideIcons.rocket),
          ),
          PlagroundIconButtonStyle.secondary => ShadIconButton.secondary(
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Secondary'),
          ),
          PlagroundIconButtonStyle.destructive => ShadIconButton.destructive(
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Destructive'),
          ),
          PlagroundIconButtonStyle.outline => ShadIconButton.outline(
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Outline'),
          ),
          PlagroundIconButtonStyle.ghost => ShadIconButton.ghost(
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Ghost'),
          ),
          PlagroundIconButtonStyle.loading => ShadIconButton(
            icon: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ShadTheme.of(context).colorScheme.primaryForeground,
              ),
            ),
          ),
          PlagroundIconButtonStyle.gradientShadow => ShadIconButton(
            gradient: const LinearGradient(
              colors: [
                Colors.cyan,
                Colors.indigo,
              ],
            ),
            shadows: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: .4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            icon: const Icon(LucideIcons.rocket),
          ),
        },
      ),
    );
  }
}
