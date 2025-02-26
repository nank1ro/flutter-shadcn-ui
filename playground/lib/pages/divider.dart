import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({
    super.key,
    required this.style,
  });

  final ShadDividerVariant style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadDividerVariant.horizontal => const ShadDivider.horizontal(
                thickness: 4,
                margin: EdgeInsets.symmetric(horizontal: 20),
                radius: BorderRadius.all(Radius.circular(4)),
              ),
            ShadDividerVariant.vertical => const ShadDivider.vertical(
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
