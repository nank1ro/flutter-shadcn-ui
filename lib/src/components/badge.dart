import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadBadgeVariant {
  primary,
  secondary,
  outline,
  destructive,
}

class ShadBadge extends StatefulWidget {
  const ShadBadge({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadBadgeVariant.primary;

  const ShadBadge.secondary({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadBadgeVariant.secondary;

  const ShadBadge.outline({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadBadgeVariant.outline;

  const ShadBadge.destructive({
    super.key,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  }) : variant = ShadBadgeVariant.destructive;

  const ShadBadge.raw({
    super.key,
    required this.variant,
    required this.text,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  });

  final ShadBadgeVariant variant;
  final Widget text;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;

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

  EdgeInsets? padding(ShadThemeData theme) {
    return widget.padding ?? badgeTheme(theme).padding;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
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
                style: TextStyle(
                  color: foreground(theme),
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
