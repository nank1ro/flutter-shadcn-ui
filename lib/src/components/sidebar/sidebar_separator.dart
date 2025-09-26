import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/separator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSidebarSeparator extends StatelessWidget {
  const ShadSidebarSeparator({
    this.margin = EdgeInsets.zero,
    super.key,
  });
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    return ShadSeparator.horizontal(
      color: cs.sidebarBorder,
      margin: margin,
    );
  }
}
