import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_item.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSidebarMenu extends StatelessWidget {
  const ShadSidebarMenu({
    super.key,
    this.spacing = 2,
    this.items = const [],
  });

  final List<ShadSidebarItem> items;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: spacing,
      children: items,
    );
  }
}

class ShadSidebarSubMenu extends ShadSidebarMenu {
  const ShadSidebarSubMenu({
    super.key,
    super.spacing,
    required super.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final borderColor = theme.colorScheme.sidebarBorder;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: BorderSide(color: borderColor),
        ),
      ),
      child: super.build(context),
    );
  }
}
