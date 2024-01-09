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
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  }) : variant = ShadcnButtonVariant.$default;

  const ShadcnButton.raw({
    super.key,
    required this.variant,
    required this.size,
    this.text,
    this.icon,
    this.onPressed,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  });

  const ShadcnButton.destructive({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  }) : variant = ShadcnButtonVariant.destructive;

  const ShadcnButton.outline({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  }) : variant = ShadcnButtonVariant.outline;

  const ShadcnButton.secondary({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  }) : variant = ShadcnButtonVariant.secondary;

  const ShadcnButton.ghost({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  }) : variant = ShadcnButtonVariant.ghost;

  const ShadcnButton.link({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
    this.applyIconColorFilter = true,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
  })  : variant = ShadcnButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final ShadcnButtonVariant variant;
  final ShadcnButtonSize size;

  final bool applyIconColorFilter;
  final MouseCursor? cursor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final BoxBorder? border;

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

  void assertCheckHasTextOrIcon() {
    assert(
      widget.text != null || widget.icon != null,
      'Either text or icon must be provided',
    );
  }

  double get height {
    if (widget.height != null) return widget.height!;
    return switch (widget.size) {
      ShadcnButtonSize.$default => 40,
      ShadcnButtonSize.sm => 36,
      ShadcnButtonSize.lg => 44,
      ShadcnButtonSize.icon => 40,
    };
  }

  double? get width {
    if (widget.width != null) return widget.width!;
    return switch (widget.size) {
      ShadcnButtonSize.icon => 40,
      _ => null,
    };
  }

  EdgeInsets get padding {
    if (widget.padding != null) return widget.padding!;
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
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primary,
      ShadcnButtonVariant.destructive => theme.destructive,
      ShadcnButtonVariant.secondary => theme.secondary,
      _ => null,
    };
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    if (widget.hoverBackgroundColor != null) {
      return widget.hoverBackgroundColor!;
    }
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primary.withOpacity(.9),
      ShadcnButtonVariant.destructive => theme.destructive.withOpacity(.9),
      ShadcnButtonVariant.secondary => theme.secondary.withOpacity(.8),
      ShadcnButtonVariant.ghost => theme.accent,
      ShadcnButtonVariant.outline => theme.accent,
      _ => null,
    };
  }

  Color foreground(ShadcnThemeData theme) {
    if (widget.foregroundColor != null) return widget.foregroundColor!;
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
      ShadcnButtonVariant.ghost => theme.primary,
    };
  }

  Color hoverForeground(ShadcnThemeData theme) {
    if (widget.hoverForegroundColor != null) {
      return widget.hoverForegroundColor!;
    }
    return switch (widget.variant) {
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.ghost => theme.accentForeground,
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
    };
  }

  TextDecoration? textDecoration({required bool hovered}) {
    return switch (widget.variant) {
      ShadcnButtonVariant.link => hovered ? TextDecoration.underline : null,
      _ => null,
    };
  }

  BoxBorder? border(ShadcnThemeData theme) {
    if (widget.border != null) return widget.border!;
    return switch (widget.variant) {
      ShadcnButtonVariant.outline => Border.all(color: theme.input),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    assertCheckHasTextOrIcon();

    final shadcnTheme = ShadcnTheme.of(context);

    // Applies the foreground color filter to the icon if provided
    var icon = widget.icon;
    if (icon != null && widget.applyIconColorFilter) {
      icon = ColorFiltered(
        colorFilter: ColorFilter.mode(
          foreground(shadcnTheme),
          BlendMode.srcIn,
        ),
        child: icon,
      );
    }

    return Opacity(
      opacity: widget.onPressed == null ? .5 : 1,
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        cursor: widget.cursor ??
            (widget.onPressed == null
                ? MouseCursor.defer
                : SystemMouseCursors.click),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: ValueListenableBuilder(
            valueListenable: isHovered,
            builder: (context, hovered, child) {
              return Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: hovered
                      ? hoverBackground(shadcnTheme)
                      : background(shadcnTheme),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: border(shadcnTheme),
                ),
                padding: padding,
                child: child,
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) icon,
                    if (widget.text != null)
                      ValueListenableBuilder(
                        valueListenable: isHovered,
                        builder: (context, hovered, _) {
                          return DefaultTextStyle(
                            style: TextStyle(
                              color: hovered
                                  ? hoverForeground(shadcnTheme)
                                  : foreground(shadcnTheme),
                              decoration: textDecoration(hovered: hovered),
                              decorationColor: foreground(shadcnTheme),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                            textAlign: TextAlign.center,
                            child: widget.text!,
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
