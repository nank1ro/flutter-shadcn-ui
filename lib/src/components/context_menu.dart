import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

const kContextMenuGroupId = ValueKey('context-menu');

/// {@template ShadContextMenuRegion}
/// A widget that shows the context menu when the user right clicks the [child]
/// or long presses it (only on android and ios), unless a value to
/// [longPressEnabled] is provided.
/// {@endtemplate}
class ShadContextMenuRegion extends StatefulWidget {
  /// {@macro ShadContextMenuRegion}
  const ShadContextMenuRegion({
    super.key,
    required this.child,
    required this.items,
    this.visible,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
    this.longPressEnabled,
  });

  /// {@template ShadContextMenuRegion.child}
  /// The child that triggers the visibility of the context menu.
  /// {@endtemplate}
  final Widget child;

  /// {@macro ShadContextMenu.items}
  final List<Widget> items;

  /// {@macro ShadContextMenu.visible}
  final bool? visible;

  /// {@macro ShadContextMenu.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadContextMenu.onHoverArea}
  final ValueChanged<bool>? onHoverArea;

  /// {@macro ShadContextMenu.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadMouseArea.groupId}
  final Object? groupId;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadContextMenu.controller}
  final ShadContextMenuController? controller;

  /// {@template ShadContextMenuRegion.longPressEnabled}
  /// Whether the context menu should be shown when the user long presses the
  /// child, defaults to true only on Android and iOS.
  /// {@endtemplate}
  final bool? longPressEnabled;

  @override
  State<ShadContextMenuRegion> createState() => _ShadContextMenuRegionState();
}

class _ShadContextMenuRegionState extends State<ShadContextMenuRegion> {
  ShadContextMenuController? _controller;
  ShadContextMenuController get controller =>
      widget.controller ??
      (_controller ??=
          ShadContextMenuController(isOpen: widget.visible ?? false));
  Offset? offset;

  final isContextMenuAlreadyDisabled = kIsWeb && !BrowserContextMenu.enabled;

  @override
  void didUpdateWidget(covariant ShadContextMenuRegion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != null) {
      controller.setOpen(widget.visible!);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void showAtOffset(Offset offset) {
    if (!mounted) return;
    setState(() => this.offset = offset);
    controller.show();
  }

  void hide() {
    controller.hide();
  }

  void show(Offset offset) {
    showAtOffset(offset);
  }

  void onLongPress() {
    assert(offset != null, 'offset must not be null');
    showAtOffset(offset!);
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final effectiveLongPressEnabled = widget.longPressEnabled ??
        (platform == TargetPlatform.android || platform == TargetPlatform.iOS);

    final isWindows = platform == TargetPlatform.windows;

    return ShadContextMenu(
      anchor: offset == null ? null : ShadGlobalAnchor(offset!),
      controller: controller,
      items: widget.items,
      constraints: widget.constraints,
      onHoverArea: widget.onHoverArea,
      padding: widget.padding,
      groupId: widget.groupId,
      effects: widget.effects,
      shadows: widget.shadows,
      decoration: widget.decoration,
      filter: widget.filter,
      child: ShadGestureDetector(
        onTapDown: (_) => hide(),
        onSecondaryTapDown: (d) async {
          if (kIsWeb && !isContextMenuAlreadyDisabled) {
            await BrowserContextMenu.disableContextMenu();
          }
          if (!isWindows) show(d.globalPosition);
        },
        onSecondaryTapUp: (d) async {
          if (isWindows) {
            show(d.globalPosition);
            await Future<void>.delayed(Duration.zero);
          }
          if (kIsWeb && !isContextMenuAlreadyDisabled) {
            await BrowserContextMenu.enableContextMenu();
          }
        },
        onLongPressStart: effectiveLongPressEnabled
            ? (d) {
                offset = d.globalPosition;
              }
            : null,
        onLongPress: effectiveLongPressEnabled ? onLongPress : null,
        child: widget.child,
      ),
    );
  }
}

typedef ShadContextMenuController = ShadPopoverController;

class ShadContextMenu extends StatefulWidget {
  const ShadContextMenu({
    super.key,
    required this.child,
    required this.items,
    this.anchor,
    this.visible,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
  });

  /// {@template ShadContextMenu.child}
  /// The child of the context menu.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadContextMenu.items}
  /// The items of the context menu.
  /// {@endtemplate}
  final List<Widget> items;

  /// {@template ShadContextMenu.anchor}
  /// The anchor of the context menu.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadContextMenu.visible}
  /// Whether the context menu is visible, defaults to null.
  /// {@endtemplate}
  final bool? visible;

  /// {@template ShadContextMenu.constraints}
  /// The constraints of the context menu, defaults to
  /// `BoxConstraints(minWidth: 128)`.
  /// {@endtemplate}
  final BoxConstraints? constraints;

  /// {@template ShadContextMenu.onHoverArea}
  /// The callback called when the hover area changes.
  /// {@endtemplate}
  final ValueChanged<bool>? onHoverArea;

  /// {@template ShadContextMenu.padding}
  /// The padding of the context menu, defaults to
  /// `EdgeInsets.symmetric(vertical: 4)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadMouseArea.groupId}
  final Object? groupId;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@template ShadContextMenu.controller}
  /// The controller of the context menu, starts from isOpen set to false.
  /// {@endtemplate}
  final ShadContextMenuController? controller;

  @override
  State<ShadContextMenu> createState() => ShadContextMenuState();
}

class ShadContextMenuState extends State<ShadContextMenu> {
  ShadContextMenuController? _controller;
  ShadContextMenuController get controller =>
      widget.controller ??
      (_controller ??=
          ShadContextMenuController(isOpen: widget.visible ?? false));

  @override
  void didUpdateWidget(covariant ShadContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != null) {
      controller.setOpen(widget.visible!);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // ignore: use_setters_to_change_properties
  void setVisible(bool visible) {
    controller.setOpen(visible);
  }

  @override
  Widget build(BuildContext context) {
    // if the context menu has no items, just return the child
    if (widget.items.isEmpty) return widget.child;

    final theme = ShadTheme.of(context);

    final effectiveConstraints = widget.constraints ??
        theme.contextMenuTheme.constraints ??
        const BoxConstraints(minWidth: 128);

    final effectivePadding = widget.padding ??
        theme.contextMenuTheme.padding ??
        const EdgeInsets.symmetric(vertical: 4);

    final effectiveDecoration =
        widget.decoration ?? theme.contextMenuTheme.decoration;

    final effectiveFilter = widget.filter ?? theme.contextMenuTheme.filter;

    final effectiveEffects = widget.effects ?? theme.contextMenuTheme.effects;

    final effectiveShadows = widget.shadows ?? theme.contextMenuTheme.shadows;

    Widget child = ShadPopover(
      controller: controller,
      padding: effectivePadding,
      areaGroupId: widget.groupId,
      groupId: kContextMenuGroupId,
      anchor: widget.anchor,
      decoration: effectiveDecoration,
      effects: effectiveEffects,
      shadows: effectiveShadows,
      filter: effectiveFilter,
      useSameGroupIdForChild: false,
      popover: (context) {
        return ShadMouseArea(
          groupId: widget.groupId,
          key: ValueKey(widget.groupId),
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
                    children: widget.items,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: ShadMouseArea(
        groupId: widget.groupId,
        onEnter: (_) => widget.onHoverArea?.call(true),
        onExit: (_) => widget.onHoverArea?.call(false),
        child: widget.child,
      ),
    );

    // just put one context menu inherited widget.
    final contextMenu = context.maybeRead<ShadContextMenuState>();
    if (contextMenu == null) {
      child = ShadProvider(data: this, child: child);
    }

    return child;
  }
}

class ShadContextMenuItemController extends ChangeNotifier {
  ShadContextMenuItemController({
    required this.itemKey,
    bool hovered = false,
    bool focused = false,
  })  : _hovered = hovered,
        _focused = focused;

  bool _hovered = false;
  bool get hovered => _hovered;
  void setHovered(bool hovered) {
    if (hovered == _hovered) return;
    _hovered = hovered;
    notifyListeners();
  }

  bool _focused = false;
  bool get focused => _focused;
  void setFocused(bool focused) {
    if (focused == _focused) return;
    _focused = focused;
    notifyListeners();
  }

  final Key itemKey;

  /// Maps the item key to the item controller
  final Map<Key, ShadContextMenuItemController> items = {};

  bool get selected =>
      _hovered || _focused || items.values.any((e) => e.selected);

  void registerSubItem(ShadContextMenuItemController controller) {
    items[controller.itemKey] = controller;
  }

  void unregisterSubItem(ShadContextMenuItemController controller) {
    items.remove(controller.itemKey);
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
    this.items = const [],
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
    this.items = const [],
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
    this.items = const [],
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
  /// defaults to `true` when [items] is empty, otherwise `false`.
  /// {@endtemplate}
  final bool? closeOnTap;

  /// {@template ShadContextMenuItem.items}
  /// The submenu items of the context menu item.
  /// {@endtemplate}
  final List<Widget> items;

  @override
  State<ShadContextMenuItem> createState() => _ShadContextMenuItemState();
}

class _ShadContextMenuItemState extends State<ShadContextMenuItem> {
  final itemKey = UniqueKey();
  late final controller = ShadContextMenuItemController(itemKey: itemKey);
  // get the parent item controller, if any, meaning this item is a submenu
  late final parentItemController =
      context.maybeRead<ShadContextMenuItemController>();

  bool get hasTrailingIcon => widget.items.isNotEmpty;

  @override
  void initState() {
    super.initState();
    // register the subitem controller if this item is a submenu
    parentItemController?.registerSubItem(controller);
  }

  @override
  void dispose() {
    parentItemController?.unregisterSubItem(controller);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
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
        ShadAnchor(
          overlayAlignment: Alignment.topRight,
          offset: Offset(-8, parentItemController != null ? -5 : -3),
        );

    final effectiveHeight =
        widget.height ?? theme.contextMenuTheme.height ?? 32;

    final effectiveButtonVariant = widget.buttonVariant ??
        theme.contextMenuTheme.buttonVariant ??
        ShadButtonVariant.ghost;

    final effectiveDecoration = widget.decoration ??
        theme.contextMenuTheme.itemDecoration ??
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

    final effectiveCloseOnTap = widget.closeOnTap ??
        theme.contextMenuTheme.closeOnTap ??
        widget.items.isEmpty;

    /// if the item has submenu items, use the current item key,
    /// otherwise use the parent item controller's item key
    /// or the current item key if there is no parent item
    final effectiveGroupId = widget.items.isNotEmpty
        ? itemKey
        : parentItemController?.itemKey ?? itemKey;

    Widget child = ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return ShadContextMenu(
          visible: controller.selected,
          anchor: effectiveAnchor,
          constraints: widget.constraints,
          padding: widget.subMenuPadding,
          groupId: effectiveGroupId,
          onHoverArea: controller.setHovered,
          items: widget.items,
          child: Padding(
            padding: effectivePadding,
            child: ShadButton.raw(
              height: effectiveHeight,
              enabled: widget.enabled,
              variant: effectiveButtonVariant,
              decoration: effectiveDecoration,
              width: double.infinity,
              padding: effectiveInsetPadding,
              backgroundColor: controller.selected
                  ? effectiveSelectedBackgroundColor
                  : effectiveBackgroundColor,
              onFocusChange: controller.setFocused,
              onPressed: () {
                widget.onPressed?.call();
                if (effectiveCloseOnTap) contextMenu.setVisible(false);
              },
              child: child,
            ),
          ),
        );
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
    );

    // if the item has at least one submenu item, wrap it in a provider to
    //provide the controller to the submenu items
    if (widget.items.isNotEmpty) {
      child = ShadProvider(
        data: controller,
        child: child,
      );
    }

    return child;
  }
}
