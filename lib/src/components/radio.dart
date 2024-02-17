import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focused.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadRadioGroup<T> extends StatefulWidget {
  const ShadRadioGroup({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
  });

  /// The initial value of the radio group.
  final T? initialValue;

  /// The items of the radio group, any Widget can be used.
  final Iterable<Widget> items;

  /// Called when the user toggles a radio on.
  final ValueChanged<T?>? onChanged;

  /// Whether the radio [items] are enabled, defaults to true.
  final bool enabled;

  @override
  State<ShadRadioGroup<T>> createState() => ShadRadioGroupState<T>();

  static ShadRadioGroupState<T> of<T>(BuildContext context) {
    return maybeOf<T>(context)!;
  }

  static ShadRadioGroupState<T>? maybeOf<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            ShadInheritedRadioGroupContainer<T>>()
        ?.data;
  }
}

class ShadRadioGroupState<T> extends State<ShadRadioGroup<T>> {
  late T? selected = widget.initialValue;

  @override
  void didUpdateWidget(covariant ShadRadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      selected = widget.initialValue;
    }
  }

  void select(T value, {bool hideOptions = true}) {
    final changed = value != selected;
    if (!changed) return;
    setState(() => selected = value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return ShadInheritedRadioGroupContainer(
      data: this,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items.toList(),
      ),
    );
  }
}

class ShadInheritedRadioGroupContainer<T> extends InheritedWidget {
  const ShadInheritedRadioGroupContainer({
    super.key,
    required this.data,
    required super.child,
  });

  final ShadRadioGroupState<T> data;

  @override
  bool updateShouldNotify(ShadInheritedRadioGroupContainer<T> oldWidget) =>
      true;
}

class ShadRadio<T> extends StatefulWidget {
  const ShadRadio({
    super.key,
    required this.value,
    this.enabled = true,
    this.focusNode,
    this.decoration,
    this.size,
    this.duration,
    this.borderWidth,
    this.color,
    this.label,
    this.sublabel,
    this.padding,
    this.direction,
  });

  /// The value of the radio.
  final T value;

  final bool enabled;

  /// The focus node of the radio.
  final FocusNode? focusNode;

  /// The decoration of the radio.
  final ShadDecoration? decoration;

  /// The size of the radio, defaults to 16.
  final double? size;

  /// The duration of the radio animation, defaults to 100ms.
  final Duration? duration;

  /// The color of the radio.
  final Color? color;

  /// The border width of the radio, defaults to 1.
  final double? borderWidth;

  /// An optional label for the radio, displayed on the right side if
  /// the [direction] is `TextDirection.ltr`.
  final Widget? label;

  /// An optional sublabel for the radio, displayed below the label.
  final Widget? sublabel;

  /// The padding between the radio and the label, defaults to
  /// `EdgeInsets.only(left: 8)`.
  final EdgeInsets? padding;

  /// The direction of the radio.
  final TextDirection? direction;

  @override
  State<ShadRadio<T>> createState() => _ShadRadioState<T>();
}

class _ShadRadioState<T> extends State<ShadRadio<T>> {
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    assert(
      ShadRadioGroup.maybeOf<T>(context) != null,
      'Cannot find ShadRadioGroup InheritedWidget',
    );
    final theme = ShadTheme.of(context);
    final inheritedRadioGroup = ShadRadioGroup.of<T>(context);
    final selected = inheritedRadioGroup.selected == widget.value;
    final enabled = widget.enabled && inheritedRadioGroup.widget.enabled;

    final effectiveDecoration =
        widget.decoration ?? theme.radioTheme.decoration ?? theme.decoration;
    final effectiveSize = widget.size ?? theme.radioTheme.size ?? 16;
    final effectiveColor =
        widget.color ?? theme.radioTheme.color ?? theme.colorScheme.primary;
    final effectiveBorderWidth =
        widget.borderWidth ?? theme.radioTheme.borderWidth ?? 1;
    final effectiveDuration =
        widget.duration ?? theme.radioTheme.duration ?? 100.milliseconds;
    final effectivePadding = widget.padding ??
        theme.radioTheme.padding ??
        const EdgeInsets.only(left: 8);

    final radio = Semantics(
      checked: selected,
      child: ShadDisabled(
        showForbiddenCursor: true,
        disabled: !enabled,
        child: ShadFocused(
          focusNode: focusNode,
          builder: (context, focused, child) {
            return ShadDecorator(
              focused: focused,
              decoration: effectiveDecoration,
              child: child!,
            );
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: SizedBox.square(
              dimension: effectiveSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: effectiveBorderWidth,
                    color: effectiveColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: AnimatedSwitcher(
                  duration: effectiveDuration,
                  child: selected
                      ? SizedBox.square(
                          dimension: 10,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: effectiveColor,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return ShadDisabled(
      showForbiddenCursor: true,
      disabled: !enabled,
      disabledOpacity: 1,
      child: GestureDetector(
        onTap: enabled
            ? () {
                inheritedRadioGroup.select(widget.value);
                if (!focusNode.hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              }
            : null,
        child: Row(
          textDirection: widget.direction,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            radio,
            if (widget.label != null)
              Flexible(
                child: Padding(
                  padding: effectivePadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: DefaultTextStyle(
                          style: theme.textTheme.muted.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.foreground,
                          ),
                          child: widget.label!,
                        ),
                      ),
                      if (widget.sublabel != null)
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: DefaultTextStyle(
                            style: theme.textTheme.muted,
                            child: widget.sublabel!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
