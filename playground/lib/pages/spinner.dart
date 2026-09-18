import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum SpinnerStyle { primary, sizes, button }

class SpinnerPage extends StatelessWidget {
  const SpinnerPage({super.key, required this.style});

  final SpinnerStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      body: Center(
        child: switch (style) {
          SpinnerStyle.primary => const ShadSpinner(),
          SpinnerStyle.sizes => const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              ShadSpinner(size: 16),
              ShadSpinner(size: 24),
              ShadSpinner(size: 32),
            ],
          ),
          SpinnerStyle.button => ShadButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                ShadSpinner(
                  size: 16,
                  color: theme.colorScheme.primaryForeground,
                ),
                const Text('Please wait'),
              ],
            ),
          ),
        },
      ),
    );
  }
}
