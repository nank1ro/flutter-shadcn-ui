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

    return Semantics(
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
            child: GestureDetector(
              onTap: widget.onChanged == null
                  ? null
                  : () {
                      widget.onChanged!(!widget.value);
                      if (!focusNode.hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                    },
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
      ),
    );
  }
}
