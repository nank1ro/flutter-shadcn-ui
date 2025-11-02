import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

/// An internal component used in `ShadSidebarMenuItem`
///  and `SidebarCollapsible`.
class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
    this.label,
    this.labelText,
    this.labelStyle,
    this.trailing,
    this.leadingIcon,
    this.onPressed,
    this.selected = false,
    this.enabled = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.labelPadding,
    this.height,
  });

  final double? height;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? trailing;
  final Widget? leadingIcon;
  final EdgeInsetsGeometry labelPadding;
  final void Function()? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final foregroundColor = cs.sidebarForeground;
    final hoverBgColor = cs.sidebarAccent;
    final hoverFgColor = cs.sidebarAccentForeground;
    final effectiveLabel =
        label ??
        (labelText != null ? Text(labelText!, style: labelStyle) : null);

    final state = ShadSidebar.of(context);

    final collapsedToIcons = state.collapsedToIcons;

    return ShadButton.ghost(
      height: height,
      size: ShadButtonSize.sm,
      padding: labelPadding,
      enabled: enabled,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: const Color(0x00000000),
          radius: BorderRadius.circular(8),
        ),
        focusedBorder: ShadBorder.all(
          radius: BorderRadius.circular(8),
          color: cs.sidebarRing,
        ),
        labelStyle: labelStyle,
        secondaryBorder: ShadBorder.all(
          radius: BorderRadius.circular(8),
          color: cs.sidebarRing,
        ),
      ),
      backgroundColor: selected ? cs.sidebarAccent : null,
      foregroundColor: foregroundColor,
      hoverBackgroundColor: hoverBgColor,
      hoverForegroundColor: hoverFgColor,
      mainAxisAlignment: collapsedToIcons
          ? MainAxisAlignment.center
          : mainAxisAlignment,
      onPressed: collapsedToIcons ? null : onPressed,
      trailing: collapsedToIcons
          ? null
          : Flexible(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: trailing,
              ),
            ),
      leading: leadingIcon,
      child: collapsedToIcons ? null : effectiveLabel,
    );
  }
}
