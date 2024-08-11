import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

const kContextMenuGroupId = ValueKey('context-menu');

class ShadContextMenu extends StatefulWidget {
  const ShadContextMenu({
    super.key,
    required this.child,
    required this.children,
    this.anchor,
    this.visible = false,
    this.constraints,
    this.onPopoverHoverChange,
    this.padding,
  });

  /// {@template ShadContextMenu.child}
  /// The child of the context menu.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadContextMenu.children}
  /// The children of the context menu.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadContextMenu.anchor}
  /// The anchor of the context menu.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadContextMenu.visible}
  /// Whether the context menu is visible, defaults to false.
  /// {@endtemplate}
  final bool visible;

  /// {@template ShadContextMenu.constraints}
  /// The constraints of the context menu, defaults to
  /// `BoxConstraints(minWidth: 128)`.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadContextMenu.onPopoverHoverChange}
  /// The callback called when the popover hover changes.
  /// {@endtemplate}
  final ValueChanged<bool>? onPopoverHoverChange;

  /// {@template ShadContextMenu.padding}
  /// The padding of the context menu, defaults to
  /// `EdgeInsets.symmetric(vertical: 4)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  @override
  State<ShadContextMenu> createState() => ShadContextMenuState();
}

class ShadContextMenuState extends State<ShadContextMenu> {
  late bool visible = widget.visible;

  @override
  void didUpdateWidget(covariant ShadContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    visible = widget.visible;
  }

  void setVisible(bool visible) {
    if (visible == this.visible) return;
    setState(() {
      this.visible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final effectiveConstraints =
        widget.constraints ?? const BoxConstraints(minWidth: 128);

    if (widget.children.isEmpty) return widget.child;

    final effectivePadding =
        widget.padding ?? const EdgeInsets.symmetric(vertical: 4);

    Widget child = ShadPopover(
      visible: visible,
      groupId: kContextMenuGroupId,
      padding: effectivePadding,
      anchor: widget.anchor,
      popover: (context) {
        return MouseRegion(
          onEnter: (_) {
            widget.onPopoverHoverChange?.call(true);
          },
          onExit: (_) {
            widget.onPopoverHoverChange?.call(false);
          },
          child: ConstrainedBox(
            constraints: effectiveConstraints,
            child: IntrinsicWidth(
              child: TapRegion(
                groupId: kContextMenuGroupId,
                child: FocusTraversalGroup(
                  policy: OrderedTraversalPolicy(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.children,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );

    // just put one context menu inherited widget.
    final contextMenu = context.maybeRead<ShadContextMenuState>();
    if (contextMenu == null) {
      child = ShadProvider(data: this, child: child);
    }

    return child;
  }
}

/// The variant of the context menu item.
enum ShadContextMenuItemVariant {
  primary,
  inset,
}

class ShadContextMenuItem extends StatefulWidget {
  const ShadContextMenuItem({
    super.key,
    required this.child,
    this.children = const [],
    this.enabled = true,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.padding,
    this.onPressed,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.constraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.closeOnTap,
  })  : variant = ShadContextMenuItemVariant.primary,
        insetPadding = null;

  const ShadContextMenuItem.raw({
    super.key,
    required this.variant,
    required this.child,
    this.children = const [],
    this.enabled = true,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.padding,
    this.insetPadding,
    this.onPressed,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.constraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.closeOnTap,
  });

  const ShadContextMenuItem.inset({
    super.key,
    required this.child,
    this.children = const [],
    this.enabled = true,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.padding,
    this.insetPadding,
    this.onPressed,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.constraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.closeOnTap,
  }) : variant = ShadContextMenuItemVariant.inset;

  /// {@template ShadContextMenuItem.variant}
  /// The variant of the context menu item, defaults to
  /// [ShadContextMenuItemVariant.primary].
  /// {@endtemplate}
  final ShadContextMenuItemVariant variant;

  /// {@template ShadContextMenuItem.child}
  /// The child of the context menu item.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadContextMenuItem.children}
  /// The children of the context menu item.
  /// {@endtemplate}
  final List<Widget> children;

  /// {@template ShadContextMenuItem.enabled}
  /// Whether the context menu item is enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadContextMenuItem.leading}
  /// The leading widget of the context menu item.
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadContextMenuItem.trailing}
  /// The trailing widget of the context menu item.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadContextMenuItem.leadingPadding}
  /// The padding of the leading widget, defaults to
  /// `EdgeInsets.only(right: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? leadingPadding;

  /// {@template ShadContextMenuItem.trailingPadding}
  /// The padding of the trailing widget, defaults to
  /// `EdgeInsets.only(left: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? trailingPadding;

  /// {@template ShadContextMenuItem.padding}
  /// The padding of the context menu item, defaults to
  /// `EdgeInsets.symmetric(horizontal: 4)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadContextMenuItem.insetPadding}
  /// The padding of the context menu item when it is inset, defaults to
  /// `EdgeInsets.only(left: 32, right: 8)` when the variant is inset, otherwise
  /// `EdgeInsets.symmetric(horizontal: 8)`
  /// {@endtemplate}
  final EdgeInsetsGeometry? insetPadding;

  /// {@template ShadContextMenuItem.onPressed}
  /// The callback called when the context menu item is pressed.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadContextMenuItem.anchor}
  /// The anchor of the context menu item, defaults to
  /// `ShadAnchor(overlayAlignment:
  /// Alignment.topRight, offset: Offset(-8, -3))`.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadContextMenuItem.showDelay}
  /// The delay before the context menu is shown, defaults to 100ms.
  ///
  /// This is useful when the mouse is moved outside the item and towards the
  /// submenu, to avoid losing the focus on the item.
  /// {@endtemplate}
  final Duration? showDelay;

  /// {@template ShadContextMenuItem.height}
  /// The height of the context menu item, defaults to 32.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadContextMenuItem.buttonVariant}
  /// The variant of the button of the context menu item, defaults to
  /// [ShadButtonVariant.ghost].
  /// {@endtemplate}
  final ShadButtonVariant? buttonVariant;

  /// {@template ShadContextMenuItem.decoration}
  /// The decoration of the context menu item, defaults to
  /// `ShadDecoration(secondaryBorder: ShadBorder.none)`.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadContextMenuItem.textStyle}
  /// The text style of the context menu item, defaults to
  /// `small.copyWith(fontWeight: FontWeight.normal)`.
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadContextMenuItem.trailingTextStyle}
  /// The text style of the trailing widget, defaults to
  /// `muted.copyWith(fontSize: 12, height: 1)`.
  /// {@endtemplate}
  final TextStyle? trailingTextStyle;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? subMenuPadding;

  /// {@template ShadContextMenuItem.backgroundColor}
  /// The background color of the context menu item, defaults to
  /// `null`.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadContextMenuItem.selectedBackgroundColor}
  /// The background color of the context menu item when it is selected,
  /// defaults to `theme.colorScheme.accent`.
  /// {@endtemplate}
  final Color? selectedBackgroundColor;

  /// {@template ShadContextMenuItem.closeOnTap}
  /// Whether the context menu should be closed when the item is tapped,
  /// defaults to `true` when [children] is empty, otherwise `false`.
  /// {@endtemplate}
  final bool? closeOnTap;

  @override
  State<ShadContextMenuItem> createState() => _ShadContextMenuItemState();
}

class _ShadContextMenuItemState extends State<ShadContextMenuItem> {
  bool hoveredItem = false;
  bool hoveredPopover = false;
  bool focused = false;
  bool visible = false;

  bool get hasTrailingIcon => widget.children.isNotEmpty;

  void updateVisible(Duration delay) {
    Future.delayed(delay, () {
      if (!mounted) return;
      final newVisible = hoveredItem || hoveredPopover || focused;
      if (visible == newVisible) return;
      setState(() => visible = newVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final contextMenu = context.read<ShadContextMenuState>();

    final effectivePadding = widget.padding ??
        theme.contextMenuTheme.itemPadding ??
        const EdgeInsets.symmetric(horizontal: 4);

    final defaultInsetPadding = switch (widget.variant) {
      ShadContextMenuItemVariant.primary =>
        const EdgeInsets.symmetric(horizontal: 8),
      ShadContextMenuItemVariant.inset =>
        const EdgeInsets.only(left: 32, right: 8),
    };

    final effectiveInsetPadding = widget.insetPadding ??
        theme.contextMenuTheme.insetPadding ??
        defaultInsetPadding;

    final effectiveLeadingPadding = widget.leadingPadding ??
        theme.contextMenuTheme.leadingPadding ??
        const EdgeInsets.only(right: 8);

    final effectiveTrailingPadding = widget.trailingPadding ??
        theme.contextMenuTheme.trailingPadding ??
        const EdgeInsets.only(left: 8);

    final effectiveAnchor = widget.anchor ??
        theme.contextMenuTheme.anchor ??
        const ShadAnchor(
          overlayAlignment: Alignment.topRight,
          offset: Offset(-8, -3),
        );

    final effectiveShowDelay = widget.showDelay ??
        theme.contextMenuTheme.showDelay ??
        const Duration(milliseconds: 100);

    final effectiveHeight =
        widget.height ?? theme.contextMenuTheme.height ?? 32;

    final effectiveButtonVariant = widget.buttonVariant ??
        theme.contextMenuTheme.buttonVariant ??
        ShadButtonVariant.ghost;

    final effectiveDecoration = widget.decoration ??
        theme.contextMenuTheme.decoration ??
        const ShadDecoration(
          secondaryBorder: ShadBorder.none,
          secondaryFocusedBorder: ShadBorder.none,
        );

    final effectiveTextStyle = widget.textStyle ??
        theme.contextMenuTheme.textStyle ??
        theme.textTheme.small.copyWith(fontWeight: FontWeight.normal);

    final effectiveTrailingTextStyle = widget.trailingTextStyle ??
        theme.contextMenuTheme.trailingTextStyle ??
        theme.textTheme.muted.copyWith(
          fontSize: 12,
          height: 1,
        );

    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.contextMenuTheme.backgroundColor;

    final effectiveSelectedBackgroundColor = widget.selectedBackgroundColor ??
        theme.contextMenuTheme.selectedBackgroundColor ??
        theme.colorScheme.accent;

    final effectiveCloseOnTap = widget.closeOnTap ?? widget.children.isEmpty;

    return ShadContextMenu(
      visible: visible,
      anchor: effectiveAnchor,
      constraints: widget.constraints,
      padding: widget.subMenuPadding,
      onPopoverHoverChange: (hovered) {
        hoveredPopover = hovered;
        updateVisible(effectiveShowDelay);
      },
      child: Padding(
        padding: effectivePadding,
        child: ShadButton.raw(
          height: effectiveHeight,
          enabled: widget.enabled,
          variant: effectiveButtonVariant,
          decoration: effectiveDecoration,
          width: double.infinity,
          padding: effectiveInsetPadding,
          backgroundColor: visible
              ? effectiveSelectedBackgroundColor
              : effectiveBackgroundColor,
          onHoverChange: (hovered) {
            hoveredItem = hovered;
            updateVisible(effectiveShowDelay);
          },
          onFocusChange: (focused) {
            this.focused = focused;
            updateVisible(effectiveShowDelay);
          },
          onPressed: () {
            widget.onPressed?.call();
            if (effectiveCloseOnTap) contextMenu.setVisible(false);
          },
          child: Expanded(
            child: Row(
              children: [
                if (widget.leading != null)
                  Padding(
                    padding: effectiveLeadingPadding,
                    child: widget.leading,
                  ),
                Expanded(
                  child: DefaultTextStyle(
                    style: effectiveTextStyle,
                    child: widget.child,
                  ),
                ),
                if (widget.trailing != null)
                  Padding(
                    padding: effectiveTrailingPadding,
                    child: DefaultTextStyle(
                      style: effectiveTrailingTextStyle,
                      child: widget.trailing!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      children: widget.children,
    );
  }
}
