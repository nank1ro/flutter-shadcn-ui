import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadcnBadgeVariant {
  $default,
  secondary,
  outline,
  destructive,
}

class ShadcnBadge extends StatefulWidget {
  const ShadcnBadge({
    super.key,
    required this.text,
  }) : variant = ShadcnBadgeVariant.$default;

  const ShadcnBadge.secondary({
    super.key,
    required this.text,
  }) : variant = ShadcnBadgeVariant.secondary;

  const ShadcnBadge.outline({
    super.key,
    required this.text,
  }) : variant = ShadcnBadgeVariant.outline;

  const ShadcnBadge.destructive({
    super.key,
    required this.text,
  }) : variant = ShadcnBadgeVariant.destructive;

  const ShadcnBadge.raw({
    super.key,
    required this.variant,
    required this.text,
  });

  final ShadcnBadgeVariant variant;
  final String text;

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

  Color? background(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnBadgeVariant.$default => theme.primary,
      ShadcnBadgeVariant.secondary => theme.secondary,
      ShadcnBadgeVariant.destructive => theme.destructive,
      ShadcnBadgeVariant.outline => null,
    };
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnBadgeVariant.$default => theme.primary.withOpacity(.8),
      ShadcnBadgeVariant.secondary => theme.secondary.withOpacity(.8),
      ShadcnBadgeVariant.destructive => theme.destructive.withOpacity(.8),
      ShadcnBadgeVariant.outline => null,
    };
  }

  Color? foreground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnBadgeVariant.$default => theme.primaryForeground,
      ShadcnBadgeVariant.secondary => theme.secondaryForeground,
      ShadcnBadgeVariant.destructive => theme.destructiveForeground,
      ShadcnBadgeVariant.outline => theme.foreground,
    };
  }

  BorderSide borderSide(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnBadgeVariant.outline => BorderSide(color: theme.border),
      _ => BorderSide.none,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    final shadcnTheme = ShadcnTheme.of(context);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Container(
        decoration: ShapeDecoration(
          shape: StadiumBorder(side: borderSide(shadcnTheme)),
          color: background(shadcnTheme),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: foreground(shadcnTheme),
          ),
        ),
      ),
    );
  }
}
