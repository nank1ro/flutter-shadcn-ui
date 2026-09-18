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
            SpinnerStyle.primary => const _Labeled(
              label: 'Loading',
              child: ShadSpinner(size: 32, semanticsLabel: 'Loading'),
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

/// A demo item with its label underneath, so every preview says what it shows.
class _Labeled extends StatelessWidget {
  const _Labeled({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      width: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          SizedBox(height: 48, child: Center(child: child)),
          Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }
}

class _Sizes extends StatelessWidget {
  const _Sizes();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 8,
      children: [
        _Labeled(label: '16', child: ShadSpinner(size: 16)),
        _Labeled(label: '24', child: ShadSpinner(size: 24)),
        _Labeled(label: '32', child: ShadSpinner(size: 32)),
        _Labeled(label: '48', child: ShadSpinner(size: 48)),
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
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 8,
      children: [
        _Labeled(
          label: 'primary',
          child: ShadSpinner(size: 32, color: colorScheme.primary),
        ),
        _Labeled(
          label: 'muted',
          child: ShadSpinner(size: 32, color: colorScheme.mutedForeground),
        ),
        _Labeled(
          label: 'destructive',
          child: ShadSpinner(size: 32, color: colorScheme.destructive),
        ),
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
