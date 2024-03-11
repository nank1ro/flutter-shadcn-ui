import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadProgress extends StatelessWidget {
  const ShadProgress({
    super.key,
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight,
    this.semanticsLabel,
    this.semanticsValue,
    this.borderRadius,
    this.innerBorderRadius,
  });

  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? minHeight;
  final String? semanticsLabel;
  final String? semanticsValue;
  final BorderRadius? borderRadius;
  final BorderRadius? innerBorderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveMinHeight = minHeight ?? theme.progressTheme.minHeight ?? 16;

    final effectiveColor =
        color ?? theme.progressTheme.color ?? theme.colorScheme.primary;

    final effectiveBackgroundColor = backgroundColor ??
        theme.progressTheme.backgroundColor ??
        theme.colorScheme.secondary;

    final effectiveBorderRadius = borderRadius ??
        theme.progressTheme.borderRadius ??
        const BorderRadius.all(Radius.circular(16));

    final effectiveInnerBorderRadius = innerBorderRadius ??
        theme.progressTheme.innerBorderRadius ??
        BorderRadius.zero;

    return ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: effectiveBackgroundColor,
        color: effectiveColor,
        valueColor: valueColor,
        minHeight: effectiveMinHeight,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        borderRadius: effectiveInnerBorderRadius,
      ),
    );
  }
}
