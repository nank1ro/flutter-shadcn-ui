import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadcnBadgeVariant {
  primary,
  secondary,
  outline,
  destructive,
}

class ShadcnBadge extends StatefulWidget {
  const ShadcnBadge({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadcnBadgeVariant.primary;

  const ShadcnBadge.secondary({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadcnBadgeVariant.secondary;

  const ShadcnBadge.outline({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadcnBadgeVariant.outline;

  const ShadcnBadge.destructive({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadcnBadgeVariant.destructive;

  const ShadcnBadge.raw({
    super.key,
    required this.variant,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  });

  final ShadcnBadgeVariant variant;
  final Widget text;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;

  @override
  State<ShadcnBadge> createState() => _ShadcnBadgeState();
}

class _ShadcnBadgeState extends State<ShadcnBadge> {
  final isHovered = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  ShadcnBadgeTheme badgeTheme(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnBadgeVariant.primary => theme.primaryBadgeTheme,
      ShadcnBadgeVariant.secondary => theme.secondaryBadgeTheme,
      ShadcnBadgeVariant.destructive => theme.destructiveBadgeTheme,
      ShadcnBadgeVariant.outline => theme.outlineBadgeTheme,
    };
  }

  Color? background(ShadcnThemeData theme) {
    return widget.backgroundColor ?? badgeTheme(theme).backgroundColor;
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    return widget.hoverBackgroundColor ??
        badgeTheme(theme).hoverBackgroundColor;
  }

  Color? foreground(ShadcnThemeData theme) {
    return widget.foregroundColor ?? badgeTheme(theme).foregroundColor;
  }

  ShapeBorder shape(ShadcnThemeData theme) {
    return widget.shape ?? badgeTheme(theme).shape ?? const StadiumBorder();
  }

  EdgeInsets? padding(ShadcnThemeData theme) {
    return widget.padding ?? badgeTheme(theme).padding;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    final shadcnTheme = ShadcnTheme.of(context);
    return Semantics(
      container: true,
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: ValueListenableBuilder(
          valueListenable: isHovered,
          builder: (context, hovered, child) {
            return Container(
              decoration: ShapeDecoration(
                shape: shape(shadcnTheme),
                color: hovered
                    ? hoverBackground(shadcnTheme)
                    : background(shadcnTheme),
              ),
              padding: padding(shadcnTheme),
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  color: foreground(shadcnTheme),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 16 / 12,
                ),
                textAlign: TextAlign.center,
                child: widget.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
