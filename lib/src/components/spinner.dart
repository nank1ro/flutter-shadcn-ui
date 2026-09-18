import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// A customizable indeterminate loading spinner.
///
/// The [ShadSpinner] widget displays a continuously rotating loader icon,
/// matching the shadcn/ui Spinner component. It integrates with [ShadTheme]
/// for consistent styling.
///
/// Use [ShadSpinner] for indeterminate loading states, where the completion
/// amount is unknown. For determinate progress, use `ShadProgress` instead.
class ShadSpinner extends StatefulWidget {
  /// Creates a spinner widget with the specified properties.
  const ShadSpinner({
    super.key,
    this.size,
    this.color,
    this.icon,
    this.duration,
    this.animate = true,
    this.semanticsLabel,
  });

  /// {@template ShadSpinner.size}
  /// The width and height of the spinner.
  /// Defaults to 16 if not specified.
  /// {@endtemplate}
  final double? size;

  /// {@template ShadSpinner.color}
  /// The color of the spinner icon.
  /// Defaults to the theme's primary color if not specified.
  /// {@endtemplate}
  final Color? color;

  /// {@template ShadSpinner.icon}
  /// The icon rotated by the spinner.
  /// Defaults to [LucideIcons.loaderCircle] if not specified.
  /// {@endtemplate}
  final IconData? icon;

  /// {@template ShadSpinner.duration}
  /// The duration of a single full rotation.
  /// Defaults to 1 second if not specified.
  /// {@endtemplate}
  final Duration? duration;

  /// Whether the spinner rotates.
  ///
  /// Set to false to render a static icon, which is useful in golden tests or
  /// when honouring a reduced-motion preference. Defaults to true.
  final bool animate;

  /// {@template ShadSpinner.semanticsLabel}
  /// The accessibility label announced by screen readers.
  /// Defaults to null.
  /// {@endtemplate}
  final String? semanticsLabel;

  @override
  State<ShadSpinner> createState() => _ShadSpinnerState();
}

class _ShadSpinnerState extends State<ShadSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Keeps the controller in sync with the effective duration and animate
  /// flag, both of which may come from the theme and can therefore change
  /// without this widget being rebuilt with new parameters.
  void syncAnimation({
    required Duration duration,
    required bool animate,
  }) {
    controller.duration = duration;
    if (animate) {
      if (!controller.isAnimating) controller.repeat();
    } else {
      if (controller.isAnimating) controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSize = widget.size ?? theme.spinnerTheme.size ?? 16.0;
    final effectiveColor =
        widget.color ?? theme.spinnerTheme.color ?? theme.colorScheme.primary;
    final effectiveIcon =
        widget.icon ?? theme.spinnerTheme.icon ?? LucideIcons.loaderCircle;
    final effectiveDuration =
        widget.duration ??
        theme.spinnerTheme.duration ??
        const Duration(seconds: 1);
    final effectiveSemanticsLabel =
        widget.semanticsLabel ?? theme.spinnerTheme.semanticsLabel;

    syncAnimation(duration: effectiveDuration, animate: widget.animate);

    final icon = Icon(
      effectiveIcon,
      size: effectiveSize,
      color: effectiveColor,
    );

    return Semantics(
      label: effectiveSemanticsLabel,
      liveRegion: effectiveSemanticsLabel != null,
      child: SizedBox.square(
        dimension: effectiveSize,
        child: widget.animate
            ? RotationTransition(turns: controller, child: icon)
            : icon,
      ),
    );
  }
}
