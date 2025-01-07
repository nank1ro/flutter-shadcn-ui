import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';
import 'package:shadcn_ui/src/utils/provider.dart';

class ShadRadioGroup<T> extends StatefulWidget {
  const ShadRadioGroup({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.axis,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    this.spacing,
    this.runSpacing,
  });

  /// {@template ShadRadioGroup.initialValue}
  /// The initial value of the radio group.
  /// {@endtemplate}
  final T? initialValue;

  /// {@template ShadRadioGroup.items}
  /// The items of the radio group, any Widget can be used.
  /// {@endtemplate}
  final Iterable<Widget> items;

  /// {@template ShadRadioGroup.onChanged}
  /// Called when the user toggles a radio on.
  /// {@endtemplate}
  final ValueChanged<T?>? onChanged;

  /// {@template ShadRadioGroup.enabled}
  /// Whether the radio [items] are enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadRadioGroup.axis}
  /// The axis of the radio group, defaults to [Axis.vertical].
  /// {@endtemplate}
  final Axis? axis;

  /// {@template ShadRadioGroup.spacing}
  /// The main axis spacing of the radio group items, defaults to 4
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadRadioGroup.runSpacing}
  /// The cross axis spacing of the radio group items, defaults to 0
  /// {@endtemplate}
  final double? runSpacing;

  /// {@template ShadRadioGroup.alignment}
  /// The main axis alignment of the radio group items, defaults to
  /// [WrapAlignment.start]
  /// {@endtemplate}
  final WrapAlignment? alignment;

  /// {@template ShadRadioGroup.runAlignment}
  /// The cross axis alignment of the radio group items, defaults to
  /// [WrapAlignment.start]
  /// {@endtemplate}
  final WrapAlignment? runAlignment;

  /// {@template ShadRadioGroup.crossAxisAlignment}
  /// The cross axis alignment of the radio group items, defaults to
  /// [WrapCrossAlignment.start]
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  @override
  State<ShadRadioGroup<T>> createState() => ShadRadioGroupState<T>();
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
    final theme = ShadTheme.of(context);

    final effectiveAxis = widget.axis ?? theme.radioTheme.axis ?? Axis.vertical;
    final effectiveSpacing = widget.spacing ?? theme.radioTheme.spacing ?? 4;
    final effectiveRunSpacing =
        widget.runSpacing ?? theme.radioTheme.runSpacing ?? 0;
    final effectiveAlignment =
        widget.alignment ?? theme.radioTheme.alignment ?? WrapAlignment.start;
    final effectiveRunAlignment = widget.runAlignment ??
        theme.radioTheme.runAlignment ??
        WrapAlignment.start;
    final effectiveWrapCrossAlignment = widget.crossAxisAlignment ??
        theme.radioTheme.crossAxisAlignment ??
        WrapCrossAlignment.start;

    return ShadProvider(
      data: this as ShadRadioGroupState<dynamic>,
      notifyUpdate: (_) => true,
      child: Wrap(
        direction: effectiveAxis,
        spacing: effectiveSpacing,
        runSpacing: effectiveRunSpacing,
        alignment: effectiveAlignment,
        runAlignment: effectiveRunAlignment,
        crossAxisAlignment: effectiveWrapCrossAlignment,
        children: widget.items.toList(),
      ),
    );
  }
}

class ShadRadio<T> extends StatefulWidget {
  const ShadRadio({
    super.key,
    required this.value,
    this.enabled = true,
    this.focusNode,
    this.decoration,
    this.size,
    this.circleSize,
    this.duration,
    this.color,
    this.label,
    this.sublabel,
    this.padding,
    this.direction,
    this.orderPolicy,
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

  /// The circle size of the radio, defaults to 10.
  final double? circleSize;

  /// The duration of the radio animation, defaults to 100ms.
  final Duration? duration;

  /// The color of the radio.
  final Color? color;

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

  /// {@template ShadRadio.orderPolicy}
  /// The order policy of the items that compose the radio, defaults to
  /// [WidgetOrderPolicy.linear()].
  /// {@endtemplate}
  final WidgetOrderPolicy? orderPolicy;

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
    final theme = ShadTheme.of(context);
    final inheritedRadioGroup =
        context.watch<ShadRadioGroupState<dynamic>>() as ShadRadioGroupState<T>;

    void onTap() {
      inheritedRadioGroup.select(widget.value);
      if (!focusNode.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    }

    final selected = inheritedRadioGroup.selected == widget.value;
    final enabled = widget.enabled && inheritedRadioGroup.widget.enabled;

    final effectiveDecoration =
        (theme.radioTheme.decoration ?? const ShadDecoration())
            .mergeWith(widget.decoration);

    final effectiveSize = widget.size ?? theme.radioTheme.size ?? 16;
    final effectiveCircleSize =
        widget.circleSize ?? theme.radioTheme.circleSize ?? 10;
    final effectiveColor =
        widget.color ?? theme.radioTheme.color ?? theme.colorScheme.primary;
    final effectiveDuration =
        widget.duration ?? theme.radioTheme.duration ?? 100.milliseconds;
    final effectivePadding = widget.padding ??
        theme.radioTheme.padding ??
        const EdgeInsets.only(left: 8);

    final effectiveOrderPolicy = widget.orderPolicy ??
        theme.radioTheme.orderPolicy ??
        const WidgetOrderPolicy.linear();

    final radio = Semantics(
      checked: selected,
      child: ShadDisabled(
        showForbiddenCursor: true,
        disabled: !enabled,
        child: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.enter): () {
              if (!enabled) return;
              onTap();
            },
          },
          child: ShadFocusable(
            focusNode: focusNode,
            builder: (context, focused, child) {
              return ShadDecorator(
                focused: focused,
                decoration: effectiveDecoration,
                child: child,
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox.square(
                dimension: effectiveSize,
                child: AnimatedSwitcher(
                  duration: effectiveDuration,
                  child: selected
                      ? Align(
                          child: SizedBox.square(
                            dimension: effectiveCircleSize,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: effectiveColor,
                              ),
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
        onTap: enabled ? onTap : null,
        child: Row(
          textDirection: widget.direction,
          mainAxisSize: MainAxisSize.min,
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
          ].order(effectiveOrderPolicy),
        ),
      ),
    );
  }
}
