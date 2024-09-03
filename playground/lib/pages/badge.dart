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
        child: switch (variant) {
          ShadBadgeVariant.primary => const ShadBadge(
              child: Text('Primary'),
            ),
          ShadBadgeVariant.secondary => const ShadBadge.secondary(
              child: Text('Secondary'),
            ),
          ShadBadgeVariant.outline => const ShadBadge.outline(
              child: Text('Outline'),
            ),
          ShadBadgeVariant.destructive => const ShadBadge.destructive(
              child: Text('Destructive'),
            ),
        },
      ),
    );
  }
}
