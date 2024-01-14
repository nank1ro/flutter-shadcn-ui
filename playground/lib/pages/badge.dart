import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({
    super.key,
    required this.variant,
  });

  final ShadcnBadgeVariant variant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: () {
          return switch (variant) {
            ShadcnBadgeVariant.$default => const ShadcnBadge(
                text: Text('Primary'),
              ),
            ShadcnBadgeVariant.secondary => const ShadcnBadge.secondary(
                text: Text('Secondary'),
              ),
            ShadcnBadgeVariant.outline => const ShadcnBadge.outline(
                text: Text('Outline'),
              ),
            ShadcnBadgeVariant.destructive => const ShadcnBadge.destructive(
                text: Text('Destructive'),
              ),
          };
        }(),
      ),
    );
  }
}
