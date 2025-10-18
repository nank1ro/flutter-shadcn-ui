import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

/// Variants available for the [ShadBadge] widget.
enum ShadBadgeVariant {
  primary,
  secondary,
  outline,
  destructive,
}

/// A customizable badge widget that displays content with variant-based
/// styling.
///
/// The [ShadBadge] widget is used to highlight brief pieces of information,
/// such as tags or status indicators. It supports multiple variants
/// (primary, secondary, outline, destructive) with hover effects and optional
/// tap functionality. Use the named constructors for specific variants or
/// [ShadBadge.raw] for full control.
class ShadBadge extends StatefulWidget {
  /// Creates a primary variant badge widget.
  const ShadBadge({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.cursor,
  }) : variant = ShadBadgeVariant.primary;

  /// Creates a secondary variant badge widget, typically for less prominent
  /// information.
  const ShadBadge.secondary({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.cursor,
  }) : variant = ShadBadgeVariant.secondary;

  /// Creates an outline variant badge widget, typically with a bordered
  /// appearance.
  const ShadBadge.outline({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.cursor,
  }) : variant = ShadBadgeVariant.outline;

  /// Creates a destructive variant badge widget, typically for error or warning
  /// states.
  const ShadBadge.destructive({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.cursor,
  }) : variant = ShadBadgeVariant.destructive;

  /// Creates a badge widget with a specified [variant], allowing full control
  /// over configuration.
  const ShadBadge.raw({
    super.key,
    required this.variant,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.cursor,
  });

  /// {@template ShadBadge.variant}
  /// The variant of the badge, one of [ShadBadgeVariant] options (primary,
  /// secondary, outline, destructive).
  /// Determines the visual style applied through the [ShadTheme].
  /// {@endtemplate}
  final ShadBadgeVariant variant;

  /// {@template ShadBadge.child}
  /// The content widget displayed within the badge, typically a [Text] widget.
  /// Styled with the foreground color and theme text styles.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadBadge.shape}
  /// The shape of the badge's border, overriding the theme default if
  /// specified.
  /// Typically a [StadiumBorder], but can be customized
  /// (e.g., [RoundedRectangleBorder]).
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// {@template ShadBadge.backgroundColor}
  /// The background color of the badge when not hovered, overriding the theme
  /// default if provided.
  /// Changes based on [variant] if not explicitly set.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadBadge.hoverBackgroundColor}
  /// The background color of the badge when hovered, overriding the theme
  /// default if provided.
  /// Applied during mouse hover for visual feedback.
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@template ShadBadge.foregroundColor}
  /// The color of the badge's content (e.g., text), overriding the theme
  /// default if provided.
  /// Ensures readability against the background.
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template ShadBadge.padding}
  /// Padding around the badge's content, overriding the theme default if
  /// specified.
  /// Controls the internal spacing of the badge.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadBadge.onPressed}
  /// The callback invoked when the badge is tapped, making it interactive if
  /// provided.
  /// If null, the badge remains non-interactive.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadBadge.cursor}
  /// The cursor displayed when hovering over the badge, providing feedback
  /// when the badge is interactive. Defaults to [SystemMouseCursors.click] if
  /// [onPressed] is provided, otherwise [MouseCursor.defer].
  /// {@endtemplate}
  final MouseCursor? cursor;

  @override
  State<ShadBadge> createState() => _ShadBadgeState();
}

class _ShadBadgeState extends State<ShadBadge> {
  final isHovered = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  ShadBadgeTheme badgeTheme(ShadThemeData theme) {
    return switch (widget.variant) {
      ShadBadgeVariant.primary => theme.primaryBadgeTheme,
      ShadBadgeVariant.secondary => theme.secondaryBadgeTheme,
      ShadBadgeVariant.destructive => theme.destructiveBadgeTheme,
      ShadBadgeVariant.outline => theme.outlineBadgeTheme,
    };
  }

  Color? background(ShadThemeData theme) {
    return widget.backgroundColor ?? badgeTheme(theme).backgroundColor;
  }

  Color? hoverBackground(ShadThemeData theme) {
    return widget.hoverBackgroundColor ??
        badgeTheme(theme).hoverBackgroundColor;
  }

  Color? foreground(ShadThemeData theme) {
    return widget.foregroundColor ?? badgeTheme(theme).foregroundColor;
  }

  ShapeBorder shape(ShadThemeData theme) {
    return widget.shape ?? badgeTheme(theme).shape ?? const StadiumBorder();
  }

  EdgeInsetsGeometry? padding(ShadThemeData theme) {
    return widget.padding ?? badgeTheme(theme).padding;
  }

  MouseCursor cursor(ShadThemeData theme) {
    final defaultCursor = widget.onPressed != null
        ? SystemMouseCursors.click
        : MouseCursor.defer;
    return widget.cursor ?? badgeTheme(theme).cursor ?? defaultCursor;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);

    Widget badge = Semantics(
      container: true,
      child: MouseRegion(
        cursor: cursor(theme),
        onEnter: (_) {
          isHovered.value = true;
        },
        onExit: (_) {
          isHovered.value = false;
        },
        child: ValueListenableBuilder(
          valueListenable: isHovered,
          builder: (context, hovered, child) {
            return Container(
              decoration: ShapeDecoration(
                shape: shape(theme),
                color: hovered ? hoverBackground(theme) : background(theme),
              ),
              padding: padding(theme),
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: theme.textTheme.small.copyWith(
                  color: foreground(theme),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 16 / 12,
                ),
                textAlign: TextAlign.center,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.onPressed != null) {
      badge = ShadGestureDetector(
        onTap: widget.onPressed,
        child: badge,
      );
    }
    return badge;
  }
}
