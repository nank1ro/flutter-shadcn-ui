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
        child: () {
          return switch (style) {
            PlagroundButtonStyle.primary => ShadButton(
                text: const Text('Primary'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.secondary => ShadButton.secondary(
                text: const Text('Secondary'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.destructive => ShadButton.destructive(
                text: const Text('Destructive'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.outline => ShadButton.outline(
                text: const Text('Outline'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.ghost => ShadButton.ghost(
                text: const Text('Ghost'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.link => ShadButton.link(
                text: const Text('Link'),
                onPressed: () {},
              ),
            PlagroundButtonStyle.icon => ShadButton.outline(
                size: ShadButtonSize.icon,
                icon: const Icon(
                  Icons.chevron_right,
                  size: 16,
                ),
                onPressed: () {},
              ),
            PlagroundButtonStyle.textIcon => ShadButton(
                onPressed: () {},
                text: const Text('Login with Email'),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.mail_outlined,
                    size: 16,
                  ),
                ),
              ),
            PlagroundButtonStyle.loading => ShadButton(
                onPressed: () {},
                text: const Text('Please wait'),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
            PlagroundButtonStyle.gradientShadow => ShadButton(
                onPressed: () {},
                gradient: const LinearGradient(colors: [
                  Colors.cyan,
                  Colors.indigo,
                ]),
                shadows: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.4),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                text: const Text('Gradient with Shadow'),
              ),
          };
        }(),
      ),
    );
  }
}
