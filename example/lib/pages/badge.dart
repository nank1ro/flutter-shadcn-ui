import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Badge',
      children: [
        ShadcnBadge(text: 'Primary'),
        ShadcnBadge.secondary(text: 'Secondary'),
        ShadcnBadge.destructive(text: 'Destructive'),
        ShadcnBadge.outline(text: 'Outline'),
      ],
    );
  }
}
