import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  final _focusNodes = <FocusNode>[];

  /// Returns the focus node for the given index
  FocusNode getFocusNodeForIndex(int index) {
    if (index >= _focusNodes.length) {
      for (var i = _focusNodes.length; i <= index; i++) {
        _focusNodes.add(FocusNode());
      }
    }
    return _focusNodes[index];
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    _focusNodes.clear();

    super.dispose();
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
    final effectiveRadius = widget.radius ?? theme.radius;
    final effectivePadding = widget.padding ?? const EdgeInsets.all(4);
    final effectiveBackgroundColor = widget.backgroundColor;
    final effectiveBorder =
        ShadBorder.all(color: theme.colorScheme.border, width: 1)
            .mergeWith(widget.border);

    return ShadProvider(
      data: controller,
      notifyUpdate: (oldState) {
        return oldState.data != controller;
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
  /// The anchor of the menubar item, default to
  /// `ShadAnchor(offset: Offset(-8, 8))`
  /// {@endtemplate}
  final ShadAnchor? anchor;

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

  /// {@macro ShadButton.height}
  ///
  /// Defaults to `32`.
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
    final controller = context.watch<ShadMenubarController>();
    final index = context.watch<ShadProviderIndex>().index;
    final focusNode = controller.getFocusNodeForIndex(index);

    final theme = ShadTheme.of(context);
    final effectiveAnchor =
        widget.anchor ?? const ShadAnchor(offset: Offset(-8, 8));
    final effectiveHeight = widget.height ?? 32;
    final effectiveVariant = widget.variant ?? ShadButtonVariant.ghost;
    final effectiveSelectedBackgroundColor =
        widget.selectedBackgroundColor ?? theme.colorScheme.accent;
    final effectiveButtonDecoration = const ShadDecoration(
      disableSecondaryBorder: true,
    ).mergeWith(widget.buttonDecoration);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final selected = controller.selectedIndex == index;
        popoverController.setOpen(selected);
        return ShadContextMenu(
          anchor: effectiveAnchor,
          controller: popoverController,
          items: widget.items,
          constraints: widget.constraints,
          onHoverArea: widget.onHoverArea,
          padding: widget.padding,
          groupId: widget.groupId,
          effects: widget.effects,
          shadows: widget.shadows,
          decoration: widget.decoration,
          filter: widget.filter,
          onTapUpInside: (_) {
            FocusScope.of(context).unfocus();
            controller.selectedIndex = null;
          },
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
            controller.selectedIndex = null;
          },
          child: ShadButton.raw(
            variant: effectiveVariant,
            height: effectiveHeight,
            backgroundColor: selected
                ? effectiveSelectedBackgroundColor
                : widget.backgroundColor,
            focusNode: focusNode,
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
              focusNode.requestFocus();
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
            size: widget.size,
            cursor: widget.cursor,
            width: widget.width,
            padding: widget.buttonPadding,
            hoverBackgroundColor: widget.hoverBackgroundColor,
            foregroundColor: widget.foregroundColor,
            hoverForegroundColor: widget.hoverForegroundColor,
            autofocus: widget.autofocus,
            pressedBackgroundColor: widget.pressedBackgroundColor,
            pressedForegroundColor: widget.pressedForegroundColor,
            shadows: widget.buttonShadows,
            gradient: widget.gradient,
            textDecoration: widget.textDecoration,
            hoverTextDecoration: widget.hoverTextDecoration,
            decoration: effectiveButtonDecoration,
            enabled: widget.enabled,
            statesController: widget.statesController,
            gap: widget.gap,
            mainAxisAlignment: widget.mainAxisAlignment,
            crossAxisAlignment: widget.crossAxisAlignment,
            hoverStrategies: widget.hoverStrategies,
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
            textDirection: widget.textDirection,
            expands: widget.expands,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
