import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadSwitch extends StatefulWidget {
  const ShadSwitch({
    super.key,
    required this.value,
    this.enabled = true,
    this.onChanged,
    this.focusNode,
    this.thumbColor,
    this.trackColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.height,
    this.margin,
    this.duration,
    this.decoration,
    this.direction,
    this.label,
    this.sublabel,
    this.padding,
  });

  /// Whether the switch is on or off.
  final bool value;

  /// Whether the switch is enabled, defaults to true.
  final bool enabled;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool>? onChanged;

  /// The focus node of the switch.
  final FocusNode? focusNode;

  /// The color of the switch thumb.
  final Color? thumbColor;

  /// The color of the switch track.
  final Color? trackColor;

  /// The color of the unchecked track.
  final Color? uncheckedTrackColor;

  /// The color of the checked track.
  final Color? checkedTrackColor;

  /// The width of the switch, defaults to 44.
  final double? width;

  /// The height of the switch, defaults to 24.
  final double? height;

  /// The margin of the switch, defaults to 2.
  final double? margin;

  /// The duration of the switch animation, defaults to 100ms.
  final Duration? duration;

  /// The decoration of the switch.
  final ShadDecoration? decoration;

  /// An optional label for the switch, displayed on the right side if
  /// the [direction] is `TextDirection.ltr`.
  final Widget? label;

  /// An optional sublabel for the switch, displayed below the label.
  final Widget? sublabel;

  /// The padding between the switch and the label, defaults to
  /// `EdgeInsets.only(left: 8)`.
  final EdgeInsets? padding;

  /// The direction of the switch.
  final TextDirection? direction;

  @override
  State<ShadSwitch> createState() => _ShadSwitchState();
}

class _ShadSwitchState extends State<ShadSwitch>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  late final controller = AnimationController(vsync: this);

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
    controller.animateTo(widget.value ? 1 : 0, duration: Duration.zero);
  }

  @override
  void didUpdateWidget(covariant ShadSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      controller.animateTo(widget.value ? 1 : 0);
    }
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    controller.dispose();
    super.dispose();
  }

  void onTap() {
    widget.onChanged!(!widget.value);
    if (!focusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final effectiveThumbColor = widget.thumbColor ??
        theme.switchTheme.thumbColor ??
        theme.colorScheme.background;
    final effectiveUncheckedTrackColor = widget.uncheckedTrackColor ??
        theme.switchTheme.uncheckedTrackColor ??
        theme.colorScheme.input;
    final effectiveCheckedTrackColor = widget.checkedTrackColor ??
        theme.switchTheme.checkedTrackColor ??
        theme.colorScheme.primary;
    final effectiveWidth = widget.width ?? theme.switchTheme.width ?? 44;
    final effectiveMargin = widget.margin ?? theme.switchTheme.margin ?? 2;
    final effectiveHeight = widget.height ?? theme.switchTheme.height ?? 24;
    final effectiveThumbSize = effectiveHeight - effectiveMargin * 2;
    final transitionStep =
        effectiveWidth - effectiveMargin * 2 - effectiveThumbSize;
    final effectiveDuration = widget.duration ?? 100.milliseconds;

    final effectiveDecoration =
        (theme.switchTheme.decoration ?? const ShadDecoration())
            .mergeWith(widget.decoration)
            .copyWith(
              color: widget.value
                  ? effectiveCheckedTrackColor
                  : effectiveUncheckedTrackColor,
            );

    final effectivePadding = widget.padding ??
        theme.switchTheme.padding ??
        const EdgeInsets.only(left: 8);

    final switchWidget = Semantics(
      toggled: widget.value,
      child: ShadDisabled(
        showForbiddenCursor: true,
        disabled: !widget.enabled,
        child: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.enter): () {
              if (!widget.enabled) return;
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
              child: SizedBox(
                width: effectiveWidth,
                height: effectiveHeight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(effectiveMargin),
                    child: Animate(
                      controller: controller,
                      autoPlay: false,
                      effects: [
                        MoveEffect(
                          begin: Offset.zero,
                          end: Offset(transitionStep, 0),
                          duration: effectiveDuration,
                        ),
                      ],
                      child: SizedBox(
                        width: effectiveThumbSize,
                        height: effectiveThumbSize,
                        child: ShadDecorator(
                          decoration: ShadDecoration(
                            color: effectiveThumbColor,
                            shape: BoxShape.circle,
                            merge: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return ShadDisabled(
      showForbiddenCursor: true,
      disabled: !widget.enabled,
      disabledOpacity: 1,
      child: GestureDetector(
        onTap: widget.onChanged == null ? null : onTap,
        child: Row(
          textDirection: widget.direction,
          mainAxisSize: MainAxisSize.min,
          children: [
            switchWidget,
            if (widget.label != null)
              Flexible(
                child: Padding(
                  padding: effectivePadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
