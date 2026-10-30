import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/toggle.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/toggle.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/provider.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

/// Controls the selected values of a [ShadToggleGroup].
class ShadToggleGroupController<T> extends ValueNotifier<Set<T>> {
  ShadToggleGroupController({Set<T>? initialValue})
    : super(initialValue ?? <T>{});
}

/// The selection type of a [ShadToggleGroup].
enum ShadToggleGroupType { single, multiple }

/// {@template ShadToggleGroup}
/// A set of two-state toggles, styled according to the Shadcn UI design
/// system.
///
/// Use the default constructor to allow at most one pressed item, or
/// [ShadToggleGroup.multiple] to allow any number of pressed items.
///
/// The group is a single Tab stop, entered on the first pressed item (or the
/// last focused one). The arrow keys move the focus between the items and wrap
/// around (only Up and Down in a vertical group), Home/PageUp and End/PageDown
/// move it to the first and last item, and disabled items are skipped.
/// {@endtemplate}
class ShadToggleGroup<T> extends StatefulWidget {
  /// Creates a toggle group where at most one item can be pressed.
  ShadToggleGroup({
    super.key,
    required this.items,
    T? initialValue,
    this.onChanged,
    this.allowDeselection = true,
    this.enabled = true,
    this.variant,
    this.size,
    this.axis,
    this.spacing,
    this.controller,
  }) : type = ShadToggleGroupType.single,
       initialValues = {?initialValue},
       onMultipleChanged = null;

  /// Creates a toggle group where any number of items can be pressed.
  const ShadToggleGroup.multiple({
    super.key,
    required this.items,
    this.initialValues = const {},
    ValueChanged<Set<T>>? onChanged,
    this.enabled = true,
    this.variant,
    this.size,
    this.axis,
    this.spacing,
    this.controller,
  }) : type = ShadToggleGroupType.multiple,
       onMultipleChanged = onChanged,
       onChanged = null,
       allowDeselection = true;

  /// {@template ShadToggleGroup.type}
  /// Whether at most one item ([ShadToggleGroupType.single]) or any number of
  /// items ([ShadToggleGroupType.multiple]) can be pressed.
  /// {@endtemplate}
  final ShadToggleGroupType type;

  /// {@template ShadToggleGroup.items}
  /// The items of the toggle group.
  /// {@endtemplate}
  final List<ShadToggleGroupItem<T>> items;

  /// {@template ShadToggleGroup.initialValues}
  /// The values of the items that are initially pressed.
  /// {@endtemplate}
  final Set<T> initialValues;

  /// {@template ShadToggleGroup.onChanged}
  /// Called with the pressed value when it changes, or null when the pressed
  /// item is deselected. Only used by the single type.
  /// {@endtemplate}
  final ValueChanged<T?>? onChanged;

  /// {@template ShadToggleGroup.onMultipleChanged}
  /// Called with the pressed values when they change. Only used by the
  /// multiple type.
  /// {@endtemplate}
  final ValueChanged<Set<T>>? onMultipleChanged;

  /// {@template ShadToggleGroup.allowDeselection}
  /// Whether pressing the pressed item deselects it, defaults to true.
  /// Only used by the single type.
  /// {@endtemplate}
  final bool allowDeselection;

  /// {@template ShadToggleGroup.enabled}
  /// Whether the toggle group is enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadToggleGroup.variant}
  /// The variant of the items, defaults to [ShadToggleVariant.primary].
  /// {@endtemplate}
  final ShadToggleVariant? variant;

  /// {@template ShadToggleGroup.size}
  /// The size of the items, defaults to [ShadButtonSize.regular].
  /// {@endtemplate}
  final ShadButtonSize? size;

  /// {@template ShadToggleGroup.axis}
  /// The direction in which the items are laid out, defaults to
  /// [Axis.horizontal].
  /// {@endtemplate}
  final Axis? axis;

  /// {@template ShadToggleGroup.spacing}
  /// The space between the items, defaults to 0.
  ///
  /// When 0, the items are joined together, sharing their borders. Joined items
  /// draw the focus ring inside their bounds instead of around them, otherwise
  /// the next item would paint over it.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadToggleGroup.controller}
  /// An optional controller to read or change the pressed values.
  ///
  /// With the single type, only the first pressed value (in the order of
  /// [items]) is used.
  /// {@endtemplate}
  final ShadToggleGroupController<T>? controller;

  @override
  State<ShadToggleGroup<T>> createState() => ShadToggleGroupState<T>();
}

class ShadToggleGroupState<T> extends State<ShadToggleGroup<T>> {
  ShadToggleGroupController<T>? _controller;
  final _focusNodes = <T, FocusNode>{};

  /// The original `skipTraversal` of the focus nodes given by the items,
  /// restored when they leave the group.
  final _externalSkipTraversal = <FocusNode, bool>{};

  /// The item that was focused or pressed last.
  ({T value})? _tabStop;

  ShadToggleGroupController<T> get controller =>
      widget.controller ??
      (_controller ??= ShadToggleGroupController<T>(
        initialValue: Set<T>.of(widget.initialValues),
      ));

  @override
  void didUpdateWidget(covariant ShadToggleGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != null && widget.controller == null) {
      _controller = ShadToggleGroupController<T>(
        initialValue: Set<T>.of(widget.initialValues),
      );
    } else if (oldWidget.controller == null && widget.controller != null) {
      _controller?.dispose();
      _controller = null;
    }
    if (!const SetEquality<Object?>().equals(
      oldWidget.initialValues,
      widget.initialValues,
    )) {
      controller.value = Set<T>.of(widget.initialValues);
    } else if (oldWidget.type != widget.type && widget.controller == null) {
      controller.value = _normalize(controller.value);
    }

    final values = widget.items.map((e) => e.value).toSet();
    _focusNodes.removeWhere((value, node) {
      if (values.contains(value)) return false;
      // The removed item still uses its node until the end of this frame.
      WidgetsBinding.instance.addPostFrameCallback((_) => node.dispose());
      return true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _restoreExternalFocusNodes();
    for (final node in _focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  /// Keeps only the first pressed item (in the order of the items) for the
  /// single type.
  Set<T> _normalize(Set<T> values) {
    if (widget.type == ShadToggleGroupType.multiple || values.length <= 1) {
      return values;
    }
    final first = widget.items.firstWhereOrNull(
      (item) => values.contains(item.value),
    );
    return {first?.value ?? values.first};
  }

  /// The pressed values.
  Set<T> get selectedValues => _normalize(controller.value);

  bool isSelected(T value) => selectedValues.contains(value);

  bool _isEnabled(ShadToggleGroupItem<T> item) =>
      widget.enabled && item.enabled;

  FocusNode focusNodeFor(ShadToggleGroupItem<T> item) {
    return item.focusNode ??
        _focusNodes.putIfAbsent(
          item.value,
          () => FocusNode(debugLabel: 'ShadToggleGroupItem(${item.value})'),
        );
  }

  void select(T value) {
    final previous = selectedValues;
    final next = switch (widget.type) {
      ShadToggleGroupType.single =>
        previous.contains(value)
            ? (widget.allowDeselection ? <T>{} : previous)
            : <T>{value},
      ShadToggleGroupType.multiple =>
        previous.contains(value)
            ? (Set<T>.of(previous)..remove(value))
            : (Set<T>.of(previous)..add(value)),
    };
    _tabStop = (value: value);
    _updateTabStop();

    if (!const SetEquality<Object?>().equals(controller.value, next)) {
      controller.value = next;
    }
    if (const SetEquality<Object?>().equals(previous, next)) return;
    switch (widget.type) {
      case ShadToggleGroupType.single:
        widget.onChanged?.call(next.firstOrNull);
      case ShadToggleGroupType.multiple:
        widget.onMultipleChanged?.call(Set<T>.of(next));
    }
  }

  void onItemFocusChange(T value, {required bool focused}) {
    if (focused) _tabStop = (value: value);
    // Focus listeners run while the focus manager applies its changes, which
    // must not be modified until it is done.
    scheduleMicrotask(() {
      if (mounted) _updateTabStop();
    });
  }

  /// While an item has focus it is the Tab stop, so Tab leaves the group from
  /// it. Otherwise, like Radix, focus enters on the first pressed item, then
  /// the last focused item, then the first enabled item.
  ShadToggleGroupItem<T>? _tabStopItem() {
    final enabledItems = widget.items.where(_isEnabled);
    final tabStop = _tabStop;
    final selected = selectedValues;
    return enabledItems.firstWhereOrNull(
          (i) => focusNodeFor(i).hasFocus,
        ) ??
        enabledItems.firstWhereOrNull((i) => selected.contains(i.value)) ??
        (tabStop == null
            ? null
            : enabledItems.firstWhereOrNull((i) => i.value == tabStop.value)) ??
        enabledItems.firstOrNull;
  }

  /// Makes the group a single Tab stop.
  void _updateTabStop() {
    final externalNodes = {
      for (final item in widget.items) ?item.focusNode,
    };
    _restoreExternalFocusNodes(except: externalNodes);
    for (final node in externalNodes) {
      _externalSkipTraversal.putIfAbsent(node, () => node.skipTraversal);
    }

    final tabStop = _tabStopItem();
    for (final item in widget.items) {
      focusNodeFor(item).skipTraversal = item.value != tabStop?.value;
    }
  }

  void _restoreExternalFocusNodes({Set<FocusNode> except = const {}}) {
    _externalSkipTraversal.removeWhere((node, skipTraversal) {
      if (except.contains(node)) return false;
      node.skipTraversal = skipTraversal;
      return true;
    });
  }

  void _focus(ShadToggleGroupItem<T> item) => focusNodeFor(item).requestFocus();

  void _moveFocus(int step) {
    final items = widget.items;
    var index = items.indexWhere((item) => focusNodeFor(item).hasFocus);
    if (index == -1) return;
    for (var i = 0; i < items.length; i++) {
      index = (index + step) % items.length;
      if (_isEnabled(items[index])) return _focus(items[index]);
    }
  }

  void _focusEdge({required bool first}) {
    final enabledItems = widget.items.where(_isEnabled);
    final item = first ? enabledItems.firstOrNull : enabledItems.lastOrNull;
    if (item != null) _focus(item);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final groupTheme = theme.toggleGroupTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final effectiveAxis = widget.axis ?? groupTheme.axis ?? Axis.horizontal;
    final effectiveSpacing = widget.spacing ?? groupTheme.spacing ?? 0;

    Widget group = Flex(
      direction: effectiveAxis,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: effectiveAxis == Axis.vertical
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      children: effectiveSpacing > 0
          ? widget.items.separatedBy(
              SizedBox(width: effectiveSpacing, height: effectiveSpacing),
            )
          : widget.items,
    );

    // Stretch vertical items to the width of the widest one.
    if (effectiveAxis == Axis.vertical) {
      group = IntrinsicWidth(child: group);
    }

    return ShadProvider(
      data: this as ShadToggleGroupState<dynamic>,
      notifyUpdate: (_) => true,
      child: CallbackShortcuts(
        bindings: {
          // Like shadcn/ui, a horizontal group also moves with Up and Down,
          // while a vertical group ignores Left and Right.
          if (effectiveAxis == Axis.horizontal) ...{
            const SingleActivator(LogicalKeyboardKey.arrowLeft): () =>
                _moveFocus(isRtl ? 1 : -1),
            const SingleActivator(LogicalKeyboardKey.arrowRight): () =>
                _moveFocus(isRtl ? -1 : 1),
          },
          const SingleActivator(LogicalKeyboardKey.arrowUp): () =>
              _moveFocus(-1),
          const SingleActivator(LogicalKeyboardKey.arrowDown): () =>
              _moveFocus(1),
          const SingleActivator(LogicalKeyboardKey.home): () =>
              _focusEdge(first: true),
          const SingleActivator(LogicalKeyboardKey.end): () =>
              _focusEdge(first: false),
          const SingleActivator(LogicalKeyboardKey.pageUp): () =>
              _focusEdge(first: true),
          const SingleActivator(LogicalKeyboardKey.pageDown): () =>
              _focusEdge(first: false),
        },
        child: FocusTraversalGroup(
          child: ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              _updateTabStop();
              return child!;
            },
            child: group,
          ),
        ),
      ),
    );
  }
}

/// {@template ShadToggleGroupItem}
/// An item of a [ShadToggleGroup].
///
/// The variant and size of the item are given by the group.
/// {@endtemplate}
class ShadToggleGroupItem<T> extends StatelessWidget {
  /// {@macro ShadToggleGroupItem}
  const ShadToggleGroupItem({
    super.key,
    required this.value,
    this.enabled = true,
    this.child,
    this.leading,
    this.trailing,
    this.padding,
    this.width,
    this.decoration,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
  });

  /// {@template ShadToggleGroupItem.value}
  /// The value of the item, used to identify it in the group.
  /// {@endtemplate}
  final T value;

  /// {@template ShadToggleGroupItem.enabled}
  /// Whether the item is enabled, defaults to true.
  ///
  /// The item is also disabled when the group is disabled.
  /// {@endtemplate}
  final bool enabled;

  /// {@macro ShadToggle.child}
  final Widget? child;

  /// {@macro ShadToggle.leading}
  final Widget? leading;

  /// {@macro ShadToggle.trailing}
  final Widget? trailing;

  /// {@template ShadToggleGroupItem.padding}
  /// The padding of the item, defaults to 12 horizontally.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadToggle.width}
  final double? width;

  /// {@macro ShadToggle.decoration}
  final ShadDecoration? decoration;

  /// {@template ShadToggleGroupItem.focusNode}
  /// The focus node of the item, created by the group if null.
  ///
  /// The group sets its `skipTraversal` so that only one item is a Tab stop,
  /// and restores it when the item leaves the group.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final group =
        context.watch<ShadToggleGroupState<dynamic>>()
            as ShadToggleGroupState<T>;
    final groupTheme = theme.toggleGroupTheme;

    final effectiveVariant =
        group.widget.variant ?? groupTheme.variant ?? ShadToggleVariant.primary;
    final effectiveAxis =
        group.widget.axis ?? groupTheme.axis ?? Axis.horizontal;
    final effectiveSpacing = group.widget.spacing ?? groupTheme.spacing ?? 0;

    var effectiveDecoration = decoration;
    if (effectiveSpacing == 0) {
      final items = group.widget.items;
      effectiveDecoration = _joinedDecoration(
        context,
        theme: theme,
        variant: effectiveVariant,
        axis: effectiveAxis,
        isFirst: items.first.value == value,
        isLast: items.last.value == value,
      ).merge(decoration);
    }

    return ValueListenableBuilder(
      valueListenable: group.controller,
      builder: (context, _, _) {
        return ShadToggle.raw(
          variant: effectiveVariant,
          size: group.widget.size ?? groupTheme.size,
          value: group.isSelected(value),
          onChanged: (_) => group.select(value),
          enabled: group.widget.enabled && enabled,
          padding:
              padding ??
              groupTheme.itemPadding ??
              const EdgeInsets.symmetric(horizontal: 12),
          width: width,
          minWidth: 0,
          mutuallyExclusive: group.widget.type == ShadToggleGroupType.single,
          decoration: effectiveDecoration,
          focusNode: group.focusNodeFor(this),
          autofocus: autofocus,
          onFocusChange: (focused) {
            group.onItemFocusChange(value, focused: focused);
            onFocusChange?.call(focused);
          },
          onHoverChange: onHoverChange,
          leading: leading,
          trailing: trailing,
          child: child,
        );
      },
    );
  }

  /// Rounds only the outer corners of the group and, for the outline variant,
  /// removes the border shared with the previous item.
  ShadDecoration _joinedDecoration(
    BuildContext context, {
    required ShadThemeData theme,
    required ShadToggleVariant variant,
    required Axis axis,
    required bool isFirst,
    required bool isLast,
  }) {
    final textDirection = Directionality.of(context);
    final toggleTheme = switch (variant) {
      ShadToggleVariant.primary => theme.primaryToggleTheme,
      ShadToggleVariant.outline => theme.outlineToggleTheme,
    };

    final isLtr = textDirection == TextDirection.ltr;
    final (keepLeft, keepRight, keepTop, keepBottom) = switch (axis) {
      Axis.horizontal => (
        isLtr ? isFirst : isLast,
        isLtr ? isLast : isFirst,
        true,
        true,
      ),
      Axis.vertical => (true, true, isFirst, isLast),
    };

    BorderRadiusGeometry? join(BorderRadiusGeometry? radius) {
      if (radius == null) return null;
      final r = radius.resolve(textDirection);
      return BorderRadius.only(
        topLeft: keepLeft && keepTop ? r.topLeft : Radius.zero,
        topRight: keepRight && keepTop ? r.topRight : Radius.zero,
        bottomLeft: keepLeft && keepBottom ? r.bottomLeft : Radius.zero,
        bottomRight: keepRight && keepBottom ? r.bottomRight : Radius.zero,
      );
    }

    const noSide = ShadBorderSide(width: 0);
    final dropSharedSide = !isFirst && variant == ShadToggleVariant.outline;
    final dropStart = dropSharedSide && axis == Axis.horizontal;
    final left = dropStart && isLtr ? noSide : null;
    final right = dropStart && !isLtr ? noSide : null;
    final top = dropSharedSide && axis == Axis.vertical ? noSide : null;

    final radius = join(toggleTheme.decoration?.border?.radius ?? theme.radius);
    final border = ShadBorder(
      radius: radius,
      left: left,
      right: right,
      top: top,
    );

    // Only override the focus ring the theme actually uses, otherwise the
    // focused item would lose its border.
    return switch (theme.disableSecondaryBorder) {
      // Draw the ring inside the item, an outward ring would be painted over
      // by the next item.
      false => ShadDecoration(
        border: border,
        secondaryFocusedBorder: ShadBorder(radius: radius, offset: 0),
      ),
      true => ShadDecoration(
        border: border,
        focusedBorder: dropSharedSide
            ? _focusedBorderWithSharedSide(
                theme,
                toggleTheme,
                textDirection,
                radius: join(theme.decoration.focusedBorder?.radius),
                left: left != null,
                right: right != null,
                top: top != null,
              )
            : ShadBorder(radius: join(theme.decoration.focusedBorder?.radius)),
      ),
    };
  }

  /// The focused border replaces the border, so on the shared side it must
  /// take the same space as the unfocused border, otherwise the item changes
  /// size when focused. That side gets a ring as wide as that space allows.
  ShadBorder _focusedBorderWithSharedSide(
    ShadThemeData theme,
    ShadToggleTheme toggleTheme,
    TextDirection textDirection, {
    required BorderRadiusGeometry? radius,
    required bool left,
    required bool right,
    required bool top,
  }) {
    // The same layers ShadDecorator merges.
    final unfocused = const ShadBorder()
        .merge(theme.decoration.border)
        .merge(theme.ghostButtonTheme.decoration?.border)
        .merge(toggleTheme.decoration?.border);
    final focused = const ShadBorder()
        .merge(theme.decoration.focusedBorder)
        .merge(theme.ghostButtonTheme.decoration?.focusedBorder)
        .merge(toggleTheme.decoration?.focusedBorder);
    // The dropped side has no width, so its space is only the padding.
    final space = (unfocused.padding ?? EdgeInsets.zero).resolve(textDirection);
    final padding = (focused.padding ?? EdgeInsets.zero).resolve(textDirection);

    ShadBorderSide? side(bool dropped, ShadBorderSide? focusedSide, double s) =>
        dropped ? ShadBorderSide(width: min(focusedSide?.width ?? 0, s)) : null;
    double? inset(bool dropped, ShadBorderSide? focusedSide, double s) =>
        dropped ? s - min(focusedSide?.width ?? 0, s) : null;

    return ShadBorder(
      radius: radius,
      left: side(left, focused.left, space.left),
      right: side(right, focused.right, space.right),
      top: side(top, focused.top, space.top),
      padding: padding.copyWith(
        left: inset(left, focused.left, space.left),
        right: inset(right, focused.right, space.right),
        top: inset(top, focused.top, space.top),
      ),
    );
  }
}
