import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';

/// {@template ShadSwitch}
/// A customizable switch widget, styled according to the Shadcn UI design
/// system.
///
/// Allows users to toggle between two states: on or off.
/// {@endtemplate}
class ShadSwitch extends StatefulWidget {
  /// {@macro ShadSwitch}
  const ShadSwitch({
    super.key,
    required this.value,
    this.enabled = true,
    this.onChanged,
    this.focusNode,
    this.thumbColor,
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

  /// {@template ShadSwitch.value}
  /// Whether the switch is currently on or off.
  ///
  /// Represents the current state of the switch.
  /// {@endtemplate}
  final bool value;

  /// {@template ShadSwitch.enabled}
  /// Whether the switch is enabled and can be interacted with.
  ///
  /// Defaults to true. When disabled, it visually indicates it's inactive and
  /// ignores user interactions.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadSwitch.onChanged}
  /// Callback function invoked when the switch is toggled.
  ///
  /// Provides a boolean value indicating the new state of the switch (true for
  /// on, false for off).
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template ShadSwitch.focusNode}
  /// Focus node to control the focus state of the switch.
  ///
  /// If not provided, an internal [FocusNode] is created.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadSwitch.thumbColor}
  /// Color of the switch's thumb (the draggable part).
  ///
  /// Defaults to the theme's background color.
  /// {@endtemplate}
  final Color? thumbColor;

  /// {@template ShadSwitch.uncheckedTrackColor}
  /// Color of the track when the switch is in the unchecked (off) state.
  ///
  /// Defaults to the theme's input color.
  /// {@endtemplate}
  final Color? uncheckedTrackColor;

  /// {@template ShadSwitch.checkedTrackColor}
  /// Color of the track when the switch is in the checked (on) state.
  ///
  /// Defaults to the theme's primary color.
  /// {@endtemplate}
  final Color? checkedTrackColor;

  /// {@template ShadSwitch.width}
  /// Width of the switch widget.
  ///
  /// Defaults to 44.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadSwitch.height}
  /// Height of the switch widget.
  ///
  /// Defaults to 24.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadSwitch.margin}
  /// Margin around the thumb within the track.
  ///
  /// Affects the visual spacing and thumb's draggable area. Defaults to 2.
  /// {@endtemplate}
  final double? margin;

  /// {@template ShadSwitch.duration}
  /// Duration of the animation when toggling the switch.
  ///
  /// Defaults to 100 milliseconds.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadSwitch.decoration}
  /// Custom decoration for the switch track.
  ///
  /// Allows styling the appearance of the track, such as border or background.
  /// Uses [ShadDecoration].
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadSwitch.direction}
  /// Text direction of the switch and associated label.
  ///
  /// Determines the layout direction, e.g., left-to-right (LTR) or
  /// right-to-left (RTL).
  /// {@endtemplate}
  final TextDirection? direction;

  /// {@template ShadSwitch.label}
  /// Widget to display as a label for the switch.
  ///
  /// Typically a [Text] widget describing the switch's function. Positioned to
  /// the right in LTR direction.
  /// {@endtemplate}
  final Widget? label;

  /// {@template ShadSwitch.sublabel}
  /// Widget to display as a sublabel, providing additional context below the
  /// label.
  ///
  /// Usually a smaller [Text] widget for descriptive purposes.
  /// {@endtemplate}
  final Widget? sublabel;

  /// {@template ShadSwitch.padding}
  /// Padding between the switch itself and its label.
  ///
  /// Defaults to `EdgeInsetsDirectional.only(start: 8)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

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
    if (oldWidget.focusNode != widget.focusNode) {
      if (widget.focusNode == null) {
        _focusNode = FocusNode();
      } else {
        _focusNode?.dispose();
        _focusNode = null;
      }
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

    final direction = widget.direction ?? Directionality.of(context);
    final effectiveThumbColor =
        widget.thumbColor ??
        theme.switchTheme.thumbColor ??
        theme.colorScheme.background;
    final effectiveUncheckedTrackColor =
        widget.uncheckedTrackColor ??
        theme.switchTheme.uncheckedTrackColor ??
        theme.colorScheme.input;
    final effectiveCheckedTrackColor =
        widget.checkedTrackColor ??
        theme.switchTheme.checkedTrackColor ??
        theme.colorScheme.primary;
    final effectiveWidth = widget.width ?? theme.switchTheme.width ?? 44;
    final effectiveMargin = widget.margin ?? theme.switchTheme.margin ?? 2;
    final effectiveHeight = widget.height ?? theme.switchTheme.height ?? 24;
    final effectiveThumbSize = effectiveHeight - effectiveMargin * 2;
    final transitionStep =
        effectiveWidth - effectiveMargin * 2 - effectiveThumbSize;
    final effectiveDuration =
        widget.duration ?? theme.switchTheme.duration ?? 100.milliseconds;

    final effectiveDecoration =
        (theme.switchTheme.decoration ?? const ShadDecoration())
            .merge(widget.decoration)
            .copyWith(
              color: widget.value
                  ? effectiveCheckedTrackColor
                  : effectiveUncheckedTrackColor,
            );

    final effectivePadding =
        widget.padding ??
        theme.switchTheme.padding ??
        const EdgeInsetsDirectional.only(start: 8);

    final effectiveEffects = [
      switch (direction) {
        TextDirection.ltr => MoveEffect(
          begin: Offset.zero,
          end: Offset(transitionStep, 0),
          duration: effectiveDuration,
        ),
        TextDirection.rtl => MoveEffect(
          begin: Offset.zero,
          end: Offset(-transitionStep, 0),
          duration: effectiveDuration,
        ),
      },
    ];

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space),
    ];

    final switchWidget = Semantics(
      toggled: widget.value,
      child: ShadDisabled(
        showForbiddenCursor: true,
        disabled: !widget.enabled,
        child: CallbackShortcuts(
          bindings: {
            for (final trigger in keyboardTriggers)
              trigger: () {
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
                    child: ShadAnimate(
                      controller: controller,
                      autoPlay: false,
                      effects: effectiveEffects,
                      child: Row(
                        textDirection: direction,
                        children: [
                          SizedBox(
                            width: effectiveThumbSize,
                            height: effectiveThumbSize,
                            child: ShadDecorator(
                              decoration: ShadDecoration(
                                color: effectiveThumbColor,
                                shape: BoxShape.circle,
                                canMerge: false,
                              ),
                            ),
                          ),
                        ],
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
          textDirection: direction,
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
                            style: theme.textTheme.muted.fallback(
                              color: theme.colorScheme.mutedForeground,
                            ),
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
