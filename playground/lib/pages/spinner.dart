import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum SpinnerStyle { primary, sizes, colors, button, inline }

class SpinnerPage extends StatelessWidget {
  const SpinnerPage({super.key, required this.style});

  final SpinnerStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: switch (style) {
            SpinnerStyle.primary => const ShadSpinner(
              size: 32,
              semanticsLabel: 'Loading',
            ),
            SpinnerStyle.sizes => const _Sizes(),
            SpinnerStyle.colors => const _Colors(),
            SpinnerStyle.button => const _Button(),
            SpinnerStyle.inline => const _Inline(),
          },
        ),
      ),
    );
  }
}

class _Sizes extends StatelessWidget {
  const _Sizes();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 32,
      children: [
        for (final size in const [16.0, 24.0, 32.0, 48.0])
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              SizedBox(
                height: 48,
                child: Center(child: ShadSpinner(size: size)),
              ),
              Text(
                size.toStringAsFixed(0),
                style: theme.textTheme.muted,
              ),
            ],
          ),
      ],
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      children: [
        for (final color in [
          colorScheme.primary,
          colorScheme.mutedForeground,
          colorScheme.destructive,
        ])
          ShadSpinner(size: 32, color: color),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        ShadButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ShadSpinner(size: 16, color: colorScheme.primaryForeground),
              const Text('Please wait'),
            ],
          ),
        ),
        ShadButton.outline(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              ShadSpinner(size: 16, color: colorScheme.foreground),
              const Text('Saving'),
            ],
          ),
        ),
      ],
    );
  }
}

class _Inline extends StatelessWidget {
  const _Inline();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      width: 320,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          ShadSpinner(size: 20, color: theme.colorScheme.mutedForeground),
          Flexible(
            child: Text(
              'Fetching your data…',
              style: theme.textTheme.muted,
            ),
          ),
        ],
      ),
    );
  }
}
