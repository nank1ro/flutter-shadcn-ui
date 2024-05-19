import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

class ShadCheckbox extends StatefulWidget {
  const ShadCheckbox({
    super.key,
    required this.value,
    this.enabled = true,
    this.onChanged,
    this.focusNode,
    this.decoration,
    this.size,
    this.duration,
    this.icon,
    this.color,
    this.label,
    this.sublabel,
    this.padding,
    this.direction,
  });

  /// Whether the checkbox is on or off.
  final bool value;

  /// Whether the checkbox is enabled, defaults to true.
  final bool enabled;

  /// Called when the user toggles the checkbox on or off.
  final ValueChanged<bool>? onChanged;

  /// The focus node of the checkbox.
  final FocusNode? focusNode;

  /// The decoration of the checkbox.
  final ShadDecoration? decoration;

  /// The size of the checkbox, defaults to 16.
  final double? size;

  /// The duration of the checkbox animation, defaults to 100ms.
  final Duration? duration;

  /// The icon of the checkbox.
  final Widget? icon;

  /// The color of the checkbox.
  final Color? color;

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

  void onTap() {
    if (widget.onChanged == null) return;

    widget.onChanged!(!widget.value);
    if (!focusNode.hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    final effectiveColor =
        widget.color ?? theme.checkboxTheme.color ?? theme.colorScheme.primary;

    final effectiveDecoration = (theme.checkboxTheme.decoration ??
            const ShadDecoration())
        .mergeWith(widget.decoration)
        .copyWith(color: widget.value ? effectiveColor : Colors.transparent);

    final effectiveSize = widget.size ?? theme.checkboxTheme.size ?? 16;

    final effectiveIcon = widget.icon ??
        ShadImage.square(
          LucideIcons.check,
          color: theme.colorScheme.primaryForeground,
          size: effectiveSize,
        );

    final effectiveDuration =
        widget.duration ?? theme.checkboxTheme.duration ?? 100.milliseconds;
    final effectivePadding = widget.padding ??
        theme.checkboxTheme.padding ??
        const EdgeInsets.only(left: 8);

    final checkbox = Semantics(
      checked: widget.value,
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
                width: effectiveSize,
                height: effectiveSize,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: effectiveDuration,
                    child: widget.value ? effectiveIcon : const SizedBox(),
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
