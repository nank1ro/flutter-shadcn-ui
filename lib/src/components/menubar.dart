import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/context_menu.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/provider_index.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// {@template ShadMenubarController}
/// The controller for managing the selected item of the menubar
/// {@endtemplate}
class ShadMenubarController extends ChangeNotifier {
  int? _selectedIndex;

  /// Returns the selected index of the menubar
  int? get selectedIndex => _selectedIndex;

  /// Sets the selected index of the menubar
  set selectedIndex(int? value) {
    if (_selectedIndex == value) return;
    _selectedIndex = value;
    notifyListeners();
  }
}

/// A menubar that contains a list of items, typically a list of
/// [ShadMenubarItem].
class ShadMenubar extends StatefulWidget {
  /// Creates the menubar with the given [items].
  const ShadMenubar({
    super.key,
    required this.items,
    this.radius,
    this.controller,
    this.padding,
    this.backgroundColor,
    this.border,
    this.selectOnHover,
  });

  /// {@template ShadMenubar.items}
  /// The items of the menubar
  /// {@endtemplate}
  final Iterable<Widget> items;

  /// {@template ShadMenubar.radius}
  /// The radius of the menubar, default to `theme.radius`
  /// {@endtemplate}
  final BorderRadiusGeometry? radius;

  /// {@macro ShadMenubarController}
  final ShadMenubarController? controller;

  /// {@template ShadMenubar.padding}
  /// The padding of the menubar, default to `EdgeInsets.all(4)`
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadMenubar.backgroundColor}
  /// The background color of the menubar, default to `null`
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadMenubar.border}
  /// The border of the menubar, default to
  /// `ShadBorder.all(color: theme.colorScheme.border, width: 1)`
  /// {@endtemplate}
  final ShadBorder? border;

  /// {@template ShadMenubar.selectOnHover}
  /// Whether to select the item when hovered, defaults to `true`
  /// {@endtemplate}
  final bool? selectOnHover;

  @override
  State<ShadMenubar> createState() => _ShadMenubarState();
}

class _ShadMenubarState extends State<ShadMenubar> {
  int? focusedIndex;
  ShadMenubarController? _controller;
  ShadMenubarController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = ShadMenubarController();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveRadius =
        widget.radius ?? theme.menubarTheme.radius ?? theme.radius;
    final effectivePadding =
        widget.padding ?? theme.menubarTheme.padding ?? const EdgeInsets.all(4);
    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.menubarTheme.backgroundColor;
    final effectiveBorder = ShadBorder.all(
      color: theme.colorScheme.border,
      width: 1,
    ).merge(theme.menubarTheme.border).merge(widget.border);

    return ShadProvider(
      data: this,
      notifyUpdate: (oldState) {
        return oldState.data != this;
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          border: effectiveBorder.toBorder(),
          borderRadius: effectiveRadius,
        ),
        child: Padding(
          padding: effectivePadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.items
                .mapIndexed(
                  (i, item) => ShadIndexProvider(index: i, child: item),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

/// A menubar item that contains a list of items, typically a list of
/// [ShadContextMenuItem].
class ShadMenubarItem extends StatefulWidget {
  /// Creates the menubar item with the given [items].
  const ShadMenubarItem({
    super.key,
    required this.child,
    required this.items,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
    this.anchor,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.variant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.expands,
  });

  /// The child of the menubar item
  final Widget child;

  /// {@macro ShadContextMenu.items}
  final List<Widget> items;

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

  /// {@macro ShadPopover.controller}
  final ShadPopoverController? controller;

  /// {@template ShadMenubarItem.anchor}
  /// The anchor of the context menu shown by the item, defaults to
  /// ```dart
  /// const ShadAnchorAuto(
  ///   offset: Offset(-4, 8),
  ///   followerAnchor: Alignment.bottomRight,
  ///   targetAnchor: Alignment.bottomLeft,
  /// );
  /// ```
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@macro ShadButton.onLongPress}
  final VoidCallback? onLongPress;

  /// {@macro ShadButton.leading}
  final Widget? leading;

  /// {@macro ShadButton.trailing}
  final Widget? trailing;

  /// {@macro ShadButton.variant}
  ///
  /// Defaults to `ShadButtonVariant.ghost`.
  final ShadButtonVariant? variant;

  /// {@macro ShadButton.size}
  final ShadButtonSize? size;

  /// {@macro ShadButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadButton.width}
  final double? width;

  /// {@template ShadMenubarItem.height}
  /// {@macro ShadButton.height}
  ///
  /// Defaults to `32`.
  /// {@endtemplate}
  final double? height;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.backgroundColor}
  final Color? backgroundColor;

  /// {@template ShadMenubarItem.selectedBackgroundColor}
  /// The background color of the button when the item is selected, defaults to
  /// `theme.colorScheme.accent`.
  /// {@endtemplate}
  final Color? selectedBackgroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.focusNode}
  final FocusNode? focusNode;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? gradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? textDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? hoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final ShadDecoration? buttonDecoration;

  /// {@macro ShadButton.enabled}
  final bool enabled;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  /// {@macro ShadButton.gap}
  final double? gap;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.onTapDown}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@macro ShadButton.onTapUp}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@macro ShadButton.onTapCancel}
  final VoidCallback? onTapCancel;

  /// {@macro ShadButton.onSecondaryTapDown}
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// {@macro ShadButton.onSecondaryTapUp}
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// {@macro ShadButton.onSecondaryTapCancel}
  final VoidCallback? onSecondaryTapCancel;

  /// {@macro ShadButton.onLongPressStart}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@macro ShadButton.onLongPressCancel}
  final VoidCallback? onLongPressCancel;

  /// {@macro ShadButton.onLongPressUp}
  final VoidCallback? onLongPressUp;

  /// {@macro ShadButton.onLongPressDown}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@macro ShadButton.onLongPressEnd}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@macro ShadButton.onDoubleTap}
  final VoidCallback? onDoubleTap;

  /// {@macro ShadButton.onDoubleTapDown}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@macro ShadButton.onDoubleTapCancel}
  final VoidCallback? onDoubleTapCancel;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadButton.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.expands}
  final bool? expands;

  @override
  State<ShadMenubarItem> createState() => _ShadMenubarItemState();
}

class _ShadMenubarItemState extends State<ShadMenubarItem> {
  ShadPopoverController? _popoverController;

  ShadPopoverController get popoverController =>
      widget.controller ?? _popoverController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _popoverController = ShadPopoverController();
    }
  }

  @override
  void dispose() {
    _popoverController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inherited = context.watch<_ShadMenubarState>();
    final controller = inherited.controller;
    final index = context.watch<ShadProviderIndex>().index;

    final theme = ShadTheme.of(context);
    final effectiveAnchor =
        widget.anchor ??
        theme.menubarTheme.anchor ??
        const ShadAnchorAuto(
          offset: Offset(-4, 8),
          followerAnchor: Alignment.bottomRight,
          targetAnchor: Alignment.bottomLeft,
        );

    final effectiveHeight =
        widget.height ?? theme.menubarTheme.buttonHeight ?? 32;
    final effectiveVariant =
        widget.variant ??
        theme.menubarTheme.buttonVariant ??
        ShadButtonVariant.ghost;
    final effectiveSelectedBackgroundColor =
        widget.selectedBackgroundColor ??
        theme.menubarTheme.buttonSelectedBackgroundColor ??
        theme.colorScheme.accent;
    final effectiveButtonDecoration = const ShadDecoration(
      disableSecondaryBorder: true,
    ).merge(theme.menubarTheme.buttonDecoration).merge(widget.buttonDecoration);
    final effectiveSelectOnHover =
        inherited.widget.selectOnHover ??
        theme.menubarTheme.selectOnHover ??
        true;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final selected = controller.selectedIndex == index;
        popoverController.setOpen(selected);
        return ShadContextMenu(
          anchor: effectiveAnchor,
          controller: popoverController,
          items: widget.items,
          constraints: widget.constraints ?? theme.menubarTheme.constraints,
          onHoverArea: widget.onHoverArea,
          padding: widget.padding ?? theme.menubarTheme.contextMenuPadding,
          groupId: widget.groupId,
          effects: widget.effects ?? theme.menubarTheme.effects,
          shadows: widget.shadows ?? theme.menubarTheme.shadows,
          decoration: widget.decoration ?? theme.menubarTheme.decoration,
          filter: widget.filter ?? theme.menubarTheme.filter,
          onTapUpInside: (_) {
            controller.selectedIndex = null;
          },
          onTapOutside: (_) {
            controller.selectedIndex = null;
          },
          child: ShadButton.raw(
            variant: effectiveVariant,
            height: effectiveHeight,
            backgroundColor: selected
                ? effectiveSelectedBackgroundColor
                : widget.backgroundColor ??
                      theme.menubarTheme.buttonBackgroundColor,
            focusNode: widget.focusNode,
            onFocusChange: (focused) {
              widget.onFocusChange?.call(focused);
              // Set the selected index
              if (focused) {
                controller.selectedIndex = index;
              }
            },
            onHoverChange: (hovered) {
              widget.onHoverChange?.call(hovered);
              if (!hovered) return;
              if (!effectiveSelectOnHover) return;
              controller.selectedIndex = index;
            },
            onPressed: () {
              if (!popoverController.isOpen && selected) {
                popoverController.show();
              } else {
                controller.selectedIndex = selected ? null : index;
              }
            },
            onLongPress: widget.onLongPress,
            leading: widget.leading,
            trailing: widget.trailing,
            size: widget.size ?? theme.menubarTheme.buttonSize,
            cursor: widget.cursor ?? theme.menubarTheme.buttonCursor,
            width: widget.width ?? theme.menubarTheme.buttonWidth,
            padding: widget.buttonPadding ?? theme.menubarTheme.buttonPadding,
            hoverBackgroundColor:
                widget.hoverBackgroundColor ??
                theme.menubarTheme.buttonHoverBackgroundColor,
            foregroundColor:
                widget.foregroundColor ??
                theme.menubarTheme.buttonForegroundColor,
            hoverForegroundColor:
                widget.hoverForegroundColor ??
                theme.menubarTheme.buttonHoverForegroundColor,
            autofocus: widget.autofocus,
            pressedBackgroundColor:
                widget.pressedBackgroundColor ??
                theme.menubarTheme.buttonPressedBackgroundColor,
            pressedForegroundColor:
                widget.pressedForegroundColor ??
                theme.menubarTheme.buttonPressedForegroundColor,
            shadows: widget.buttonShadows ?? theme.menubarTheme.buttonShadows,
            gradient: widget.gradient ?? theme.menubarTheme.buttonGradient,
            textDecoration:
                widget.textDecoration ??
                theme.menubarTheme.buttonTextDecoration,
            hoverTextDecoration:
                widget.hoverTextDecoration ??
                theme.menubarTheme.buttonHoverTextDecoration,
            decoration: effectiveButtonDecoration,
            enabled: widget.enabled,
            statesController: widget.statesController,
            gap: widget.gap ?? theme.menubarTheme.buttonGap,
            mainAxisAlignment:
                widget.mainAxisAlignment ??
                theme.menubarTheme.buttonMainAxisAlignment,
            crossAxisAlignment:
                widget.crossAxisAlignment ??
                theme.menubarTheme.buttonCrossAxisAlignment,
            hoverStrategies:
                widget.hoverStrategies ??
                theme.menubarTheme.buttonHoverStrategies,
            onTapDown: widget.onTapDown,
            onTapUp: widget.onTapUp,
            onTapCancel: widget.onTapCancel,
            onSecondaryTapDown: widget.onSecondaryTapDown,
            onSecondaryTapUp: widget.onSecondaryTapUp,
            onSecondaryTapCancel: widget.onSecondaryTapCancel,
            onLongPressStart: widget.onLongPressStart,
            onLongPressCancel: widget.onLongPressCancel,
            onLongPressUp: widget.onLongPressUp,
            onLongPressDown: widget.onLongPressDown,
            onLongPressEnd: widget.onLongPressEnd,
            onDoubleTap: widget.onDoubleTap,
            onDoubleTapDown: widget.onDoubleTapDown,
            onDoubleTapCancel: widget.onDoubleTapCancel,
            longPressDuration: widget.longPressDuration,
            textDirection:
                widget.textDirection ?? theme.menubarTheme.buttonTextDirection,
            expands: widget.expands ?? theme.menubarTheme.buttonExpands,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
