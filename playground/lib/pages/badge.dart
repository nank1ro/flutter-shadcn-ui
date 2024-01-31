import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({
    super.key,
    required this.variant,
  });

  final ShadBadgeVariant variant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: () {
          return switch (variant) {
            ShadBadgeVariant.primary => const ShadBadge(
                text: Text('Primary'),
              ),
            ShadBadgeVariant.secondary => const ShadBadge.secondary(
                text: Text('Secondary'),
              ),
            ShadBadgeVariant.outline => const ShadBadge.outline(
                text: Text('Outline'),
              ),
            ShadBadgeVariant.destructive => const ShadBadge.destructive(
                text: Text('Destructive'),
              ),
          };
        }(),
      ),
    );
  }
}
