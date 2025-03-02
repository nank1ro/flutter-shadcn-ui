import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class SeparatorPage extends StatelessWidget {
  const SeparatorPage({
    super.key,
    required this.style,
  });

  final ShadSeparatorVariant style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadSeparatorVariant.horizontal => const ShadSeparator.horizontal(
                thickness: 4,
                margin: EdgeInsets.symmetric(horizontal: 20),
                radius: BorderRadius.all(Radius.circular(4)),
              ),
            ShadSeparatorVariant.vertical => const ShadSeparator.vertical(
                thickness: 4,
                margin: EdgeInsets.symmetric(vertical: 20),
                radius: BorderRadius.all(Radius.circular(4)),
              ),
          },
        ),
      ),
    );
  }
}
