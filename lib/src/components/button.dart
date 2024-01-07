import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadcnButtonVariant {
  $default,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum ShadcnButtonSize {
  $default,
  sm,
  lg,
  icon,
}

class ShadcnButton extends StatefulWidget {
  const ShadcnButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.$default;

  const ShadcnButton.raw({
    super.key,
    required this.variant,
    required this.text,
    required this.size,
    this.onPressed,
    this.style,
  });

  const ShadcnButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.destructive;

  const ShadcnButton.outline({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.outline;

  const ShadcnButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.secondary;

  const ShadcnButton.ghost({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.ghost;

  const ShadcnButton.link({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.link;

  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  final ShadcnButtonVariant variant;
  final ShadcnButtonSize size;

  @override
  State<ShadcnButton> createState() => _ShadcnButtonState();
}

class _ShadcnButtonState extends State<ShadcnButton> {
  final isHovered = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  double get height {
    return switch (widget.size) {
      ShadcnButtonSize.$default => 40,
      ShadcnButtonSize.sm => 36,
      ShadcnButtonSize.lg => 44,
      ShadcnButtonSize.icon => 40,
    };
  }

  EdgeInsets get padding {
    return switch (widget.size) {
      ShadcnButtonSize.$default =>
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ShadcnButtonSize.sm => const EdgeInsets.symmetric(horizontal: 12),
      ShadcnButtonSize.lg =>
        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ShadcnButtonSize.icon => EdgeInsets.zero,
    };
  }

  Color? background(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primary,
      ShadcnButtonVariant.destructive => theme.destructive,
      ShadcnButtonVariant.secondary => theme.secondary,
      ShadcnButtonVariant.outline => null,
      ShadcnButtonVariant.ghost => null,
      ShadcnButtonVariant.link => null,
    };
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primary.withOpacity(.9),
      ShadcnButtonVariant.destructive => theme.destructive.withOpacity(.9),
      ShadcnButtonVariant.secondary => theme.secondary,
      ShadcnButtonVariant.ghost => theme.accent,
      ShadcnButtonVariant.outline => null,
      ShadcnButtonVariant.link => null,
    };
  }

  Color? foreground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
      ShadcnButtonVariant.ghost => null,
    };
  }

  Color? hoverForeground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.ghost => theme.accentForeground,
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    final shadcnTheme = ShadcnTheme.of(context);
    final effectiveStyle = widget.style ?? const TextStyle(fontSize: 14);
    return Opacity(
      opacity: widget.onPressed == null ? .5 : 1,
      child: ValueListenableBuilder(
        valueListenable: isHovered,
        builder: (context, hovered, child) {
          return Container(
            height: height,
            decoration: BoxDecoration(
              color: hovered
                  ? hoverBackground(shadcnTheme)
                  : background(shadcnTheme),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            padding: padding,
            child: child,
          );
        },
        child: MouseRegion(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          cursor: widget.onPressed == null
              ? MouseCursor.defer
              : SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: isHovered,
                  builder: (context, hovered, _) {
                    return Text(
                      widget.text,
                      style: effectiveStyle.copyWith(
                        color: hovered
                            ? hoverForeground(shadcnTheme)
                            : foreground(shadcnTheme),
                        decoration:
                            widget.variant == ShadcnButtonVariant.link &&
                                    hovered
                                ? TextDecoration.underline
                                : null,
                        decorationColor: foreground(shadcnTheme),
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
