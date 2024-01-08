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
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.$default;

  const ShadcnButton.raw({
    super.key,
    required this.variant,
    required this.size,
    this.text,
    this.icon,
    this.onPressed,
    this.style,
  });

  const ShadcnButton.destructive({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.destructive;

  const ShadcnButton.outline({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.outline;

  const ShadcnButton.secondary({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.style,
    this.size = ShadcnButtonSize.$default,
  }) : variant = ShadcnButtonVariant.secondary;

  const ShadcnButton.ghost({
    super.key,
    this.text,
    this.icon,
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
  })  : variant = ShadcnButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final TextStyle? style;
  final ShadcnButtonVariant variant;
  final ShadcnButtonSize size;

  @override
  State<ShadcnButton> createState() => _ShadcnButtonState();
}

class _ShadcnButtonState extends State<ShadcnButton> {
  final isHovered = ValueNotifier(false);

  void assertCheckHasTextOrIcon() {
    assert(
      widget.text != null || widget.icon != null,
      'Either text or icon must be provided',
    );
  }

  void assertCheckIconWithIconSize() {
    assert(
      widget.icon == null || widget.size == ShadcnButtonSize.icon,
      'Icon can only be provided if size is set to icon',
    );
  }

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

  double? get width {
    return switch (widget.size) {
      ShadcnButtonSize.icon => 40,
      _ => null,
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
      _ => null,
    };
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primary.withOpacity(.9),
      ShadcnButtonVariant.destructive => theme.destructive.withOpacity(.9),
      ShadcnButtonVariant.secondary => theme.secondary.withOpacity(.8),
      ShadcnButtonVariant.ghost => theme.accent,
      ShadcnButtonVariant.outline => theme.accent,
      _ => null,
    };
  }

  Color? foreground(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
      ShadcnButtonVariant.ghost => theme.primary,
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

  TextDecoration? textDecoration({required bool hovered}) {
    return switch (widget.variant) {
      ShadcnButtonVariant.link => hovered ? TextDecoration.underline : null,
      _ => null,
    };
  }

  BoxBorder? border(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.outline => Border.all(color: theme.input),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    assertCheckHasTextOrIcon();
    assertCheckIconWithIconSize();

    final shadcnTheme = ShadcnTheme.of(context);
    final effectiveStyle = widget.style ?? const TextStyle(fontSize: 14);

    // Applies the foreground color filter to the icon if provided
    var icon = widget.icon;
    if (icon != null && foreground(shadcnTheme) != null) {
      icon = ColorFiltered(
        colorFilter: ColorFilter.mode(
          foreground(shadcnTheme)!,
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
        cursor: widget.onPressed == null
            ? MouseCursor.defer
            : SystemMouseCursors.click,
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
                ValueListenableBuilder(
                  valueListenable: isHovered,
                  builder: (context, hovered, _) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) icon,
                        if (widget.text != null)
                          DefaultTextStyle(
                            style: effectiveStyle.copyWith(
                              color: hovered
                                  ? hoverForeground(shadcnTheme)
                                  : foreground(shadcnTheme),
                              decoration: textDecoration(hovered: hovered),
                              decorationColor: foreground(shadcnTheme),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                            textAlign: TextAlign.center,
                            child: widget.text!,
                          ),
                      ],
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
