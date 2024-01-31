import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/focused.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadCheckbox extends StatefulWidget {
  const ShadCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.focusNode,
    this.decoration,
    this.size,
    this.radius,
    this.duration,
    this.icon,
    this.borderWidth,
    this.color,
    this.label,
    this.sublabel,
    this.padding,
    this.direction,
  });

  /// Whether the checkbox is on or off.
  final bool value;

  /// Called when the user toggles the checkbox on or off.
  final ValueChanged<bool>? onChanged;

  /// The focus node of the checkbox.
  final FocusNode? focusNode;

  /// The decoration of the checkbox.
  final ShadDecorationTheme? decoration;

  /// The radius of the checkbox.
  final BorderRadius? radius;

  /// The size of the checkbox, defaults to 16.
  final double? size;

  /// The duration of the checkbox animation, defaults to 100ms.
  final Duration? duration;

  /// The icon of the checkbox.
  final Widget? icon;

  /// The color of the checkbox.
  final Color? color;

  /// The border width of the checkbox, defaults to 1.
  final double? borderWidth;

  /// An optional label for the checkbox, displayed on the right side if
  /// the [direction] is `TextDirection.ltr`.
  final Widget? label;

  /// An optional sublabel for the checkbox, displayed below the label.
  final Widget? sublabel;

  /// The padding between the checkbox and the label, defaults to
  /// `EdgeInsets.only(left: 8)`.
  final EdgeInsets? padding;

  /// The direction of the checkbox.
  final TextDirection? direction;

  @override
  State<ShadCheckbox> createState() => _ShadCheckboxState();
}

class _ShadCheckboxState extends State<ShadCheckbox> {
  FocusNode? _focusNode;

  bool get enabled => widget.onChanged != null;
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

    final effectiveDecoration =
        widget.decoration ?? theme.checkboxTheme.decoration ?? theme.decoration;
    final effectiveSize = widget.size ?? theme.checkboxTheme.size ?? 16;
    final effectiveRadius =
        widget.radius ?? theme.checkboxTheme.radius ?? theme.radius;
    final effectiveIcon = widget.icon ??
        ShadImage.square(
          ShadAssets.check,
          color: theme.colorScheme.primaryForeground,
          size: effectiveSize,
        );
    final effectiveColor =
        widget.color ?? theme.checkboxTheme.color ?? theme.colorScheme.primary;
    final effectiveBorderWidth =
        widget.borderWidth ?? theme.checkboxTheme.borderWidth ?? 1;
    final effectiveDuration =
        widget.duration ?? theme.checkboxTheme.duration ?? 100.milliseconds;
    final effectivePadding = widget.padding ??
        theme.checkboxTheme.padding ??
        const EdgeInsets.only(left: 8);

    final checkbox = Semantics(
      checked: widget.value,
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
            child: Container(
              width: effectiveSize,
              height: effectiveSize,
              decoration: BoxDecoration(
                color: widget.value ? effectiveColor : null,
                border: Border.all(
                  width: effectiveBorderWidth,
                  color: effectiveColor,
                ),
                borderRadius: effectiveRadius,
              ),
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: effectiveDuration,
                child: widget.value ? effectiveIcon : const SizedBox(),
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
        onTap: widget.onChanged == null
            ? null
            : () {
                widget.onChanged!(!widget.value);
                if (!focusNode.hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
        child: Row(
          textDirection: widget.direction,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checkbox,
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
