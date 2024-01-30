import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadSwitch extends StatefulWidget {
  const ShadSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.focusNode,
    this.thumbColor,
    this.trackColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.margin,
    this.duration,
    this.decoration,
    this.radius,
  });

  /// Whether the switch is on or off.
  final bool value;

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

  /// The margin of the switch, defaults to 2.
  final double? margin;

  /// The duration of the switch animation, defaults to 100ms.
  final Duration? duration;

  /// The radius of the switch, defaults to 24.
  final BorderRadius? radius;

  /// The decoration of the switch.
  final ShadcnDecorationTheme? decoration;

  @override
  State<ShadSwitch> createState() => _ShadSwitchState();
}

class _ShadSwitchState extends State<ShadSwitch> with TickerProviderStateMixin {
  FocusNode? _focusNode;
  late final controller = AnimationController(vsync: this);

  bool get enabled => widget.onChanged != null;
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
    controller.animateTo(widget.value ? 1 : 0, duration: Duration.zero);
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShadSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      controller.animateTo(widget.value ? 1 : 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);
    final effectiveRadius = widget.radius ??
        theme.switchTheme.radius ??
        const BorderRadius.all(Radius.circular(24));
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
    final effectiveHeight = effectiveWidth * 0.54;
    final effectiveThumbSize = effectiveHeight - effectiveMargin * 2;
    final transitionStep =
        effectiveWidth - effectiveMargin * 2 - effectiveThumbSize;
    final effectiveDuration = widget.duration ?? 100.milliseconds;
    final effectiveDecoration =
        widget.decoration ?? theme.switchTheme.decoration ?? theme.decoration;

    return Semantics(
      toggled: widget.value,
      child: ShadDisabled(
        showForbiddenCursor: true,
        disabled: !enabled,
        child: ShadFocused(
          focusNode: focusNode,
          builder: (context, focused) {
            return ShadcnDecorator(
              focused: focused,
              decoration: effectiveDecoration,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: widget.onChanged == null
                      ? null
                      : () => widget.onChanged!(!widget.value),
                  child: Container(
                    width: effectiveWidth,
                    height: effectiveHeight,
                    decoration: BoxDecoration(
                      color: widget.value
                          ? effectiveCheckedTrackColor
                          : effectiveUncheckedTrackColor,
                      border: Border.all(
                        width: effectiveMargin,
                        color: Colors.transparent,
                      ),
                      borderRadius: effectiveRadius,
                    ),
                    alignment: Alignment.centerLeft,
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
                      child: Container(
                        width: effectiveThumbSize,
                        height: effectiveThumbSize,
                        decoration: BoxDecoration(
                          color: effectiveThumbColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
