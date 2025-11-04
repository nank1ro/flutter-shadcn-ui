import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/disabled.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';

/// A customizable checkbox widget with optional label and sublabel.
///
/// The [ShadCheckbox] widget allows users to toggle a boolean state, visually
/// represented by a checkmark within a styled box. It supports enabling/disabling,
/// focus handling, animations, and integrates with [ShadTheme] for consistent
/// styling.
class ShadCheckbox extends StatefulWidget {
  /// Creates a checkbox widget with the specified state and options.
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
    this.crossAxisAlignment,
    this.checkboxPadding,
  });

  /// {@template ShadCheckbox.value}
  /// Whether the checkbox is checked (true) or unchecked (false).
  /// Required to set the initial state of the checkbox.
  /// {@endtemplate}
  final bool value;

  /// {@template ShadCheckbox.enabled}
  /// Whether the checkbox is interactive.
  /// Defaults to true; if false, the checkbox is disabled and visually dimmed.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadCheckbox.onChanged}
  /// Callback invoked when the checkbox is toggled.
  /// If null, the checkbox is non-interactive but still visible.
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template ShadCheckbox.focusNode}
  /// The focus node for keyboard navigation and focus handling.
  /// If null, an internal focus node is created.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadCheckbox.decoration}
  /// The decoration applied to the checkbox box.
  /// Merged with the theme’s default decoration if provided.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadCheckbox.size}
  /// The size (width and height) of the checkbox box.
  /// Defaults to 16 if not specified.
  /// {@endtemplate}
  final double? size;

  /// {@template ShadCheckbox.duration}
  /// The duration of the checkmark animation when toggling.
  /// Defaults to 100 milliseconds if not specified.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadCheckbox.icon}
  /// The icon displayed when the checkbox is checked.
  /// Defaults to a checkmark icon if not specified.
  /// {@endtemplate}
  final Widget? icon;

  /// {@template ShadCheckbox.color}
  /// The color of the checkbox when checked.
  /// Defaults to the theme’s primary color if not specified.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadCheckbox.label}
  /// An optional label displayed next to the checkbox.
  /// Typically a [Text] widget, positioned based on [direction].
  /// {@endtemplate}
  final Widget? label;

  /// {@template ShadCheckbox.sublabel}
  /// An optional sublabel displayed below the label.
  /// Typically a [Text] widget, enhancing the checkbox description.
  /// {@endtemplate}
  final Widget? sublabel;

  /// {@template ShadCheckbox.padding}
  /// The padding between the checkbox and its label/sublabel.
  /// Defaults to `EdgeInsetsDirectional.only(start: 8)` if not specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadCheckbox.checkboxPadding}
  /// The padding around the checkbox field only.
  ///
  /// Defaults to `EdgeInsets.only(top: 1)` if not specified.
  /// {@endtemplate}
  final EdgeInsetsGeometry? checkboxPadding;

  /// {@template ShadCheckbox.direction}
  /// The text direction for arranging the checkbox and label/sublabel.
  /// Defaults to null (inherits from context) if not specified.
  /// {@endtemplate}
  final TextDirection? direction;

  /// {@template ShadCheckbox.crossAxisAlignment}
  /// The cross-axis alignment of the checkbox and label/sublabel.
  /// Defaults to [CrossAxisAlignment.start] if both label and sublabel are
  /// present, otherwise [CrossAxisAlignment.center].
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

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

    final effectiveDecoration =
        (theme.checkboxTheme.decoration ?? const ShadDecoration())
            .merge(widget.decoration)
            .copyWith(
              color: widget.value ? effectiveColor : const Color(0x00000000),
            );

    final effectiveSize = widget.size ?? theme.checkboxTheme.size ?? 16;

    final effectiveIcon =
        widget.icon ??
        Icon(
          LucideIcons.check,
          color: theme.colorScheme.primaryForeground,
          size: effectiveSize,
        );

    final effectiveDuration =
        widget.duration ?? theme.checkboxTheme.duration ?? 100.milliseconds;
    final effectivePadding =
        widget.padding ??
        theme.checkboxTheme.padding ??
        const EdgeInsetsDirectional.only(start: 8);

    final effectiveCheckboxPadding =
        widget.checkboxPadding ??
        theme.checkboxTheme.checkboxPadding ??
        const EdgeInsets.only(top: 1);

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space),
    ];

    final checkbox = Semantics(
      checked: widget.value,
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

    final defaultCrossAxisAlignment =
        widget.label != null && widget.sublabel != null
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        theme.checkboxTheme.crossAxisAlignment ??
        defaultCrossAxisAlignment;

    return ShadDisabled(
      showForbiddenCursor: true,
      disabled: !widget.enabled,
      disabledOpacity: 1,
      child: GestureDetector(
        onTap: widget.onChanged == null ? null : onTap,
        child: Row(
          textDirection: widget.direction,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: effectiveCrossAxisAlignment,
          children: [
            Padding(
              padding: effectiveCheckboxPadding,
              child: checkbox,
            ),
            if (widget.label != null || widget.sublabel != null)
              Flexible(
                child: Padding(
                  padding: effectivePadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.label != null)
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
