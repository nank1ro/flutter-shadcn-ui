import 'package:flutter/widgets.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/sidebar/common/sidebar_button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class SidebarCollapsible extends StatefulWidget {
  const SidebarCollapsible({
    super.key,
    this.content,
    this.labelText,
    this.label,
    this.labelStyle,
    this.iconBuilder,
    this.leadingIcon,
    required this.labelPadding,
    required this.initiallyCollapsed,
    this.buttonHeight,
  });
  final double? buttonHeight;
  final Widget? content;
  final EdgeInsetsGeometry labelPadding;
  final String? labelText;
  final Widget? label;
  final TextStyle? labelStyle;
  final bool initiallyCollapsed;
  final Widget Function(bool collapsed)? iconBuilder;
  final Widget? leadingIcon;

  @override
  State<SidebarCollapsible> createState() => _SidebarCollapsibleState();
}

class _SidebarCollapsibleState extends State<SidebarCollapsible> {
  late bool collapsed = widget.initiallyCollapsed;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final state = ShadSidebar.of(context);
    final collapsedToIcons = state.collapsedToIcons;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SidebarButton(
          height: widget.buttonHeight,
          label: widget.label,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          labelPadding: widget.labelPadding,
          leadingIcon: widget.leadingIcon,
          onPressed: () {
            setState(() => collapsed = !collapsed);
          },
          trailing: _trailing(theme),
        ),
        Flexible(
          child: Offstage(
            offstage: collapsed || collapsedToIcons,
            child: widget.content,
          ),
        ),
      ],
    );
  }

  Widget _trailing(ShadThemeData theme) {
    return widget.iconBuilder != null
        ? widget.iconBuilder!(collapsed)
        : AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turns: collapsed ? 0 : -(1.0 / 2.0),
            child: Icon(
              LucideIcons.chevronDown,
              color: theme.colorScheme.sidebarForeground,
            ),
          );
  }
}
