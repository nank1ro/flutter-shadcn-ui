import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum ProgressStyle {
  determinate,
  indeterminate,
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({
    super.key,
    required this.style,
  });

  final ProgressStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
          ),
          child: switch (style) {
            ProgressStyle.determinate => const ShadProgress(value: 0.5),
            ProgressStyle.indeterminate => const ShadProgress(),
          },
        ),
      ),
    );
  }
}
