import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/toggle.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
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
  /// When 0, the items are joined together, sharing their borders.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadToggleGroup.controller}
  /// An optional controller to read or change the pressed values.
  /// {@endtemplate}
  final ShadToggleGroupController<T>? controller;

  @override
  State<ShadToggleGroup<T>> createState() => ShadToggleGroupState<T>();
}

class ShadToggleGroupState<T> extends State<ShadToggleGroup<T>> {
  ShadToggleGroupController<T>? _controller;

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
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  List<T> get orderedValues => widget.items.map((e) => e.value).toList();

  void select(T value) {
    final previous = controller.value;
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
    if (const SetEquality<Object?>().equals(previous, next)) return;

    controller.value = next;
    switch (widget.type) {
      case ShadToggleGroupType.single:
        widget.onChanged?.call(next.firstOrNull);
      case ShadToggleGroupType.multiple:
        widget.onMultipleChanged?.call(Set<T>.of(next));
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final groupTheme = theme.toggleGroupTheme;

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
      child: FocusTraversalGroup(child: group),
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

  /// {@macro ShadButton.focusNode}
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
      final orderedValues = group.orderedValues;
      effectiveDecoration = _joinedDecoration(
        context,
        theme: theme,
        variant: effectiveVariant,
        axis: effectiveAxis,
        isFirst: orderedValues.first == value,
        isLast: orderedValues.last == value,
      ).merge(decoration);
    }

    return ValueListenableBuilder(
      valueListenable: group.controller,
      builder: (context, values, _) {
        return ShadToggle.raw(
          variant: effectiveVariant,
          size: group.widget.size ?? groupTheme.size,
          value: values.contains(value),
          onChanged: (_) => group.select(value),
          enabled: group.widget.enabled && enabled,
          padding:
              padding ??
              groupTheme.itemPadding ??
              const EdgeInsets.symmetric(horizontal: 12),
          width: width,
          decoration: effectiveDecoration,
          focusNode: focusNode,
          autofocus: autofocus,
          onFocusChange: onFocusChange,
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

    BorderRadiusGeometry? join(BorderRadiusGeometry? radius) {
      if (radius == null) return null;
      final r = radius.resolve(textDirection);
      return switch (axis) {
        Axis.horizontal => BorderRadiusDirectional.horizontal(
          start: isFirst ? r.topLeft : Radius.zero,
          end: isLast ? r.topRight : Radius.zero,
        ),
        Axis.vertical => BorderRadius.vertical(
          top: isFirst ? r.topLeft : Radius.zero,
          bottom: isLast ? r.bottomLeft : Radius.zero,
        ),
      };
    }

    const noSide = ShadBorderSide(width: 0);
    final dropSharedSide = !isFirst && variant == ShadToggleVariant.outline;
    final dropStart = dropSharedSide && axis == Axis.horizontal;

    final radius = join(toggleTheme.decoration?.border?.radius ?? theme.radius);
    final border = ShadBorder(
      radius: radius,
      left: dropStart && textDirection == TextDirection.ltr ? noSide : null,
      right: dropStart && textDirection == TextDirection.rtl ? noSide : null,
      top: dropSharedSide && axis == Axis.vertical ? noSide : null,
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
        focusedBorder: ShadBorder(
          radius: join(theme.decoration.focusedBorder?.radius),
        ),
      ),
    };
  }
}
