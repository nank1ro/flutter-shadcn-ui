import 'package:flutter/widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/context_menu.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/components/sidebar/common/sidebar_button.dart';
import 'package:shadcn_ui/src/components/sidebar/common/sidebar_collapsible.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_menu.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

class ShadSidebarItem extends StatelessWidget {
  const ShadSidebarItem({
    super.key,
    this.trailing,
    this.leading,
    this.label,
    this.labelText,
    this.labelStyle,
    this.selected = false,
    this.onPressed,
    this.labelPadding = const EdgeInsets.all(8),
    this.dense = false,
    this.subItemsSpacing = 2,
    this.subItems,
  }) : collapsible = false;

  const ShadSidebarItem._({
    super.key,
    this.trailing,
    this.leading,
    this.label,
    this.labelText,
    this.labelStyle,
    this.selected = false,
    this.onPressed,
    this.labelPadding = const EdgeInsets.all(8),
    this.subItemsSpacing = 2,
    required this.collapsible,
    this.subItems,
    this.dense = false,
  }) : assert(
         (label != null) ^ (labelText != null),
         'Either label or labelText must be provided',
       );

  const factory ShadSidebarItem.collapsible({
    Key? key,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    bool initiallyCollapsed,
    Widget Function(bool collapsed)? trailingIconBuilder,
    EdgeInsetsGeometry labelPadding,
    Widget? leading,
    bool dense,
    required List<ShadSidebarItem> items,
  }) = _CollapsibleSidebarItem;

  const factory ShadSidebarItem.contextMenu({
    Key? key,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry labelPadding,
    Widget? leading,
    bool dense,
    bool enabled,
    ShadDecoration? menuDecoration,
    BoxConstraints menuConstraints,
    required List<Widget> items,
  }) = _ShadContextMenuSidebarItem;

  final Widget? leading;
  final Widget? trailing;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? label;
  final bool selected;
  final void Function()? onPressed;
  final bool collapsible;
  final EdgeInsetsGeometry labelPadding;
  final List<ShadSidebarItem>? subItems;
  final double subItemsSpacing;

  /// {@template ShadSidebarMenuItem.dense}
  /// Whether to render the item in a compact layout.
  ///
  /// This will set the height of the item to `32` pixels.
  /// Defaults to `false`.
  /// {@endtemplate}
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final c = ShadSidebar.of(context);
    final collapsedToIcons = c.collapsedToIcons;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SidebarButton(
          height: dense ? 32 : null,
          labelPadding: labelPadding,
          onPressed: onPressed,
          trailing: trailing,
          label: label,
          labelText: labelText,
          leadingIcon: leading,
          selected: selected,
          labelStyle:
              labelStyle ??
              TextStyle(
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
              ),
        ),
        if (subItems != null && !collapsedToIcons)
          ShadSidebarSubMenu(items: subItems!, spacing: subItemsSpacing),
      ],
    );
  }
}

class _CollapsibleSidebarItem extends ShadSidebarItem {
  const _CollapsibleSidebarItem({
    super.key,
    super.label,
    super.labelText,
    super.labelStyle,
    this.trailingIconBuilder,
    this.initiallyCollapsed = false,
    super.leading,
    super.labelPadding = const EdgeInsets.all(8),
    super.dense,
    double itemsSpacing = 2,
    required List<ShadSidebarItem> items,
  }) : super._(
         collapsible: true,
         subItems: items,
         subItemsSpacing: itemsSpacing,
       );

  final bool initiallyCollapsed;
  final Widget Function(bool collapsed)? trailingIconBuilder;

  @override
  Widget build(BuildContext context) {
    return SidebarCollapsible(
      label: label,
      labelText: labelText,
      labelStyle: labelStyle ?? const TextStyle(fontWeight: FontWeight.w400),
      leadingIcon: leading,
      labelPadding: labelPadding,
      initiallyCollapsed: initiallyCollapsed,
      buttonHeight: dense ? 32 : null,
      iconBuilder: trailingIconBuilder,
      content: ShadSidebarSubMenu(items: subItems!, spacing: subItemsSpacing),
    );
  }
}

class _ShadContextMenuSidebarItem extends ShadSidebarItem {
  const _ShadContextMenuSidebarItem({
    super.label,
    super.labelText,
    super.labelStyle,
    super.leading,
    super.labelPadding,
    super.dense,
    super.key,
    this.menuConstraints = const BoxConstraints(minWidth: 192),
    this.menuDecoration,
    this.enabled = true,
    required this.items,
  });
  final List<Widget> items;
  final ShadDecoration? menuDecoration;
  final BoxConstraints menuConstraints;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _PopoverMenuItem(
      items: items,
      menuDecoration: menuDecoration,
      menuConstraints: menuConstraints,
      enabled: enabled,
      label: label,
      labelText: labelText,
      labelPadding: labelPadding,
      labelStyle: labelStyle,
      leading: leading,
      dense: dense,
    );
  }
}

class _PopoverMenuItem extends StatefulWidget {
  const _PopoverMenuItem({
    required this.items,
    this.menuDecoration,
    this.label,
    this.labelText,
    this.leading,
    this.labelStyle,
    required this.dense,
    required this.labelPadding,
    required this.menuConstraints,
    required this.enabled,
  });

  final List<Widget> items;
  final ShadDecoration? menuDecoration;
  final BoxConstraints menuConstraints;
  final bool enabled;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry labelPadding;
  final Widget? leading;
  final bool dense;

  @override
  State<_PopoverMenuItem> createState() => _PopoverMenuItemState();
}

class _PopoverMenuItemState extends State<_PopoverMenuItem> {
  late final controller = ShadPopoverController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sidebarState = ShadSidebar.of(context);
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return ShadContextMenu(
          controller: controller,
          decoration: widget.menuDecoration,
          items: widget.items,
          visible: controller.isOpen,
          constraints: widget.menuConstraints,
          effects: [
            const FadeEffect(
              begin: 0,
              end: 1,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeIn,
            ),
            const ScaleEffect(
              begin: Offset(.95, .95),
              end: Offset(1, 1),
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 150),
            ),
            MoveEffect(
              begin: sidebarState.isPhysicalLeft
                  ? const Offset(-8, 0)
                  : const Offset(8, 0),
              end: Offset.zero,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 150),
            ),
          ],
          anchor: ShadAnchor(
            overlayAlignment: sidebarState.isPhysicalLeft
                ? Alignment.topRight
                : Alignment.topLeft,
            childAlignment: sidebarState.isPhysicalLeft
                ? Alignment.topLeft
                : Alignment.topRight,
          ),
          child: SidebarButton(
            height: widget.dense ? 32 : null,
            enabled: widget.enabled,
            label: widget.label,
            labelText: widget.labelText,
            leadingIcon: widget.leading,
            labelPadding: widget.labelPadding,
            labelStyle:
                widget.labelStyle ??
                const TextStyle(fontWeight: FontWeight.w400),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            trailing: const Icon(LucideIcons.ellipsis, size: 16),
            selected: controller.isOpen,
            onPressed: controller.toggle,
          ),
        );
      },
    );
  }
}
