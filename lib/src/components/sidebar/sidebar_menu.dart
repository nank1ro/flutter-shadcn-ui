import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/components/sidebar/common/sidebar_button.dart';
import 'package:shadcn_ui/src/components/sidebar/common/sidebar_collapsible.dart';

class ShadSidebarMenu extends StatelessWidget {
  const ShadSidebarMenu({
    super.key,
    this.spacing = 2,
    this.items = const [],
  });

  final List<ShadSidebarMenuItem> items;
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

class ShadSidebarMenuItem extends StatelessWidget {
  const ShadSidebarMenuItem({
    super.key,
    this.trailing,
    this.leading,
    this.label,
    this.labelText,
    this.labelStyle,
    this.selected = false,
    this.onPressed,
    this.subMenu,
    this.labelPadding = const EdgeInsets.all(8),
    this.dense = false,
  })  : collapsible = false,
        isSubMenuItem = false;

  const ShadSidebarMenuItem._({
    super.key,
    this.trailing,
    this.leading,
    this.label,
    this.labelText,
    this.labelStyle,
    this.selected = false,
    this.onPressed,
    this.subMenu,
    this.labelPadding = const EdgeInsets.all(8),
    required this.isSubMenuItem,
    required this.collapsible,
    this.dense = false,
  }) : assert(
          (label != null) ^ (labelText != null),
          'Either label or labelText must be provided',
        );

  const factory ShadSidebarMenuItem.collapsible({
    Key? key,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    bool initiallyCollapsed,
    Widget Function(bool collapsed)? trailingIconBuilder,
    EdgeInsetsGeometry labelPadding,
    Widget? leading,
    bool dense,
    required ShadSidebarSubMenu subMenu,
  }) = _CollapsibleSidebarMenuItem;

  final Widget? leading;
  final Widget? trailing;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? label;
  final bool selected;
  final void Function()? onPressed;
  final bool collapsible;
  final ShadSidebarSubMenu? subMenu;
  final EdgeInsetsGeometry labelPadding;
  final bool isSubMenuItem;

  /// {@template ShadSidebarMenuItem.dense}
  /// Whether to render the item in a compact layout.
  ///
  /// This will set the height of the item to `32` pixels.
  /// Defaults to `false`.
  /// {@endtemplate}
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final c = ShadSidebarController.of(context);
    final collapsedToIcons = !c.extended && c.collapseMode.isIcons;

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
          labelStyle: labelStyle ??
              TextStyle(
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
              ),
        ),
        if (subMenu != null && !collapsedToIcons) subMenu!,
      ],
    );
  }
}

class _CollapsibleSidebarMenuItem extends ShadSidebarMenuItem {
  const _CollapsibleSidebarMenuItem({
    super.key,
    super.label,
    super.labelText,
    super.labelStyle,
    this.trailingIconBuilder,
    this.initiallyCollapsed = false,
    super.leading,
    super.labelPadding = const EdgeInsets.all(8),
    super.dense,
    required ShadSidebarSubMenu super.subMenu,
  }) : super._(collapsible: true, isSubMenuItem: false);

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
      content: subMenu,
    );
  }
}

class ShadSidebarSubMenu extends ShadSidebarMenu {
  const ShadSidebarSubMenu({
    super.key,
    super.spacing,
    required List<ShadSidebarSubMenuItem> super.items,
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

class ShadSidebarSubMenuItem extends ShadSidebarMenuItem {
  const ShadSidebarSubMenuItem({
    super.key,
    super.trailing,
    super.label,
    super.labelText,
    super.labelStyle,
    super.leading,
    super.labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    super.selected,
    super.onPressed,
    super.dense,
    super.subMenu,
  }) : super._(isSubMenuItem: true, collapsible: false);

  const ShadSidebarSubMenuItem._({
    super.key,
    super.trailing,
    super.label,
    super.labelText,
    super.labelStyle,
    super.selected,
    super.onPressed,
    super.subMenu,
    super.labelPadding = const EdgeInsets.symmetric(horizontal: 8),
    super.leading,
    super.dense,
    required super.collapsible,
  }) : super._(isSubMenuItem: true);

  const factory ShadSidebarSubMenuItem.collapsible({
    Key? key,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry labelPadding,
    bool initiallyCollapsed,
    Widget Function(bool collapsed)? trailingIconBuilder,
    Widget? leading,

    /// {@macro ShadSidebarMenuItem.dense}
    bool dense,
    required ShadSidebarSubMenu subMenu,
  }) = _CollapsibleShadSidebarSubMenuItem;
}

class _CollapsibleShadSidebarSubMenuItem extends ShadSidebarSubMenuItem {
  const _CollapsibleShadSidebarSubMenuItem({
    super.key,
    super.label,
    super.labelText,
    super.labelStyle,
    super.leading,
    super.dense,
    this.trailingIconBuilder,
    this.initiallyCollapsed = false,
    super.labelPadding = const EdgeInsets.all(8),
    required ShadSidebarSubMenu super.subMenu,
  }) : super._(collapsible: true);

  final bool initiallyCollapsed;
  final Widget Function(bool collapsed)? trailingIconBuilder;

  @override
  Widget build(BuildContext context) {
    return SidebarCollapsible(
      buttonHeight: dense ? 32 : null,
      label: label,
      labelText: labelText,
      labelPadding: labelPadding,
      labelStyle: labelStyle ??
          TextStyle(
            fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
          ),
      leadingIcon: leading,
      initiallyCollapsed: initiallyCollapsed,
      iconBuilder: trailingIconBuilder,
      content: subMenu,
    );
  }
}

class ShadSidebarDropdownMenuItem extends ShadSidebarMenuItem {
  const ShadSidebarDropdownMenuItem({
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
    return _DropdownMenuItem(
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

class _DropdownMenuItem extends StatefulWidget {
  const _DropdownMenuItem({
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
  State<_DropdownMenuItem> createState() => __DropdownMenuItemState();
}

class __DropdownMenuItemState extends State<_DropdownMenuItem> {
  late final controller = ShadPopoverController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final side = ShadSidebarController.of(context).side;
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
              begin: side.isLeft ? const Offset(-8, 0) : const Offset(8, 0),
              end: Offset.zero,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 150),
            ),
          ],
          anchor: ShadAnchor(
            overlayAlignment:
                side.isLeft ? Alignment.topRight : Alignment.topLeft,
            childAlignment:
                side.isLeft ? Alignment.topLeft : Alignment.topRight,
          ),
          child: SidebarButton(
            height: widget.dense ? 32 : null,
            enabled: widget.enabled,
            label: widget.label,
            labelText: widget.labelText,
            leadingIcon: widget.leading,
            labelPadding: widget.labelPadding,
            labelStyle: widget.labelStyle ??
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
