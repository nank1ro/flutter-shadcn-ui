import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadcnButtonVariant {
  primary,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum ShadcnButtonSize {
  regular,
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
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  }) : variant = ShadcnButtonVariant.primary;

  const ShadcnButton.raw({
    super.key,
    required this.variant,
    this.size,
    this.text,
    this.icon,
    this.onPressed,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  });

  const ShadcnButton.destructive({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  }) : variant = ShadcnButtonVariant.destructive;

  const ShadcnButton.outline({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  }) : variant = ShadcnButtonVariant.outline;

  const ShadcnButton.secondary({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  }) : variant = ShadcnButtonVariant.secondary;

  const ShadcnButton.ghost({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  }) : variant = ShadcnButtonVariant.ghost;

  const ShadcnButton.link({
    super.key,
    required this.text,
    this.onPressed,
    this.size,
    this.applyIconColorFilter,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  })  : variant = ShadcnButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final ShadcnButtonVariant variant;
  final ShadcnButtonSize? size;
  final bool? applyIconColorFilter;
  final MouseCursor? cursor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final ShadcnDecorationTheme? decoration;

  @override
  State<ShadcnButton> createState() => _ShadcnButtonState();
}

class _ShadcnButtonState extends State<ShadcnButton> {
  FocusNode? _focusNode;
  final isHovered = ValueNotifier(false);
  final isPressed = ValueNotifier(false);

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    isHovered.dispose();
    isPressed.dispose();
    super.dispose();
  }

  void assertCheckHasTextOrIcon() {
    assert(
      widget.text != null || widget.icon != null,
      'Either text or icon must be provided',
    );
  }

  bool get enabled => widget.onPressed != null;

  ShadcnButtonTheme buttonTheme(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.primary => theme.primaryButtonTheme,
      ShadcnButtonVariant.destructive => theme.destructiveButtonTheme,
      ShadcnButtonVariant.secondary => theme.secondaryButtonTheme,
      ShadcnButtonVariant.ghost => theme.ghostButtonTheme,
      ShadcnButtonVariant.outline => theme.outlineButtonTheme,
      ShadcnButtonVariant.link => theme.linkButtonTheme,
    };
  }

  ShadcnButtonSizeTheme sizeTheme(
    ShadcnThemeData theme,
    ShadcnButtonSize size,
  ) {
    switch (size) {
      case ShadcnButtonSize.sm:
        return buttonTheme(theme).sizesTheme?.sm ?? theme.buttonSizesTheme.sm!;
      case ShadcnButtonSize.lg:
        return buttonTheme(theme).sizesTheme?.lg ?? theme.buttonSizesTheme.lg!;
      case ShadcnButtonSize.icon:
        return buttonTheme(theme).sizesTheme?.icon ??
            theme.buttonSizesTheme.icon!;
      case ShadcnButtonSize.regular:
        return buttonTheme(theme).sizesTheme?.regular ??
            theme.buttonSizesTheme.regular!;
    }
  }

  double defaultHeightForSize(ShadcnThemeData theme, ShadcnButtonSize size) {
    return sizeTheme(theme, size).height;
  }

  double height(ShadcnThemeData theme) {
    if (widget.height != null) return widget.height!;
    if (widget.size != null) {
      return defaultHeightForSize(theme, widget.size!);
    }
    return defaultHeightForSize(theme, buttonTheme(theme).size);
  }

  double? defaultWidthForSize(ShadcnThemeData theme, ShadcnButtonSize size) {
    return sizeTheme(theme, size).width;
  }

  double? width(ShadcnThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (widget.size != null) {
      return defaultWidthForSize(theme, widget.size!);
    }
    return defaultWidthForSize(theme, buttonTheme(theme).size);
  }

  EdgeInsets defaultPaddingForSize(
    ShadcnThemeData theme,
    ShadcnButtonSize size,
  ) {
    return sizeTheme(theme, size).padding;
  }

  EdgeInsets padding(ShadcnThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (widget.size != null) {
      return defaultPaddingForSize(theme, widget.size!);
    }
    return defaultPaddingForSize(theme, buttonTheme(theme).size);
  }

  Color? background(ShadcnThemeData theme) {
    return widget.backgroundColor ?? buttonTheme(theme).backgroundColor;
  }

  Color? hoverBackground(ShadcnThemeData theme) {
    return widget.hoverBackgroundColor ??
        buttonTheme(theme).hoverBackgroundColor;
  }

  Color foreground(ShadcnThemeData theme) {
    if (widget.foregroundColor != null) return widget.foregroundColor!;

    final btnThemeForegroundColor = buttonTheme(theme).foregroundColor;
    assert(
      btnThemeForegroundColor != null,
      'Button foregroundColor is null in ShadcnButtonTheme',
    );
    return buttonTheme(theme).foregroundColor!;
  }

  Color hoverForeground(ShadcnThemeData theme) {
    if (widget.hoverForegroundColor != null) {
      return widget.hoverForegroundColor!;
    }
    final btnThemeHoverForegroundColor =
        buttonTheme(theme).hoverForegroundColor;
    assert(
      btnThemeHoverForegroundColor != null,
      'Button hoverForegroundColor is null in ShadcnButtonTheme',
    );
    return buttonTheme(theme).hoverForegroundColor!;
  }

  Color pressedBackgroundColor(ShadcnThemeData theme) {
    return widget.pressedBackgroundColor ??
        buttonTheme(theme).pressedBackgroundColor!;
  }

  Color pressedForegroundColor(ShadcnThemeData theme) {
    return widget.pressedForegroundColor ??
        buttonTheme(theme).pressedForegroundColor!;
  }

  TextDecoration? textDecoration(
    ShadcnThemeData theme, {
    required bool hovered,
  }) {
    if (hovered) {
      return widget.hoverTextDecoration ??
          buttonTheme(theme).hoverTextDecoration;
    }
    return widget.textDecoration ?? buttonTheme(theme).textDecoration;
  }

  BoxBorder? border(ShadcnThemeData theme) {
    return widget.border ?? buttonTheme(theme).border;
  }

  BorderRadius borderRadius(ShadcnThemeData theme) {
    return widget.borderRadius ?? buttonTheme(theme).radius ?? theme.radius;
  }

  MouseCursor cursor(ShadcnThemeData theme) {
    if (widget.cursor != null) return widget.cursor!;
    return (enabled
        ? buttonTheme(theme).cursor ?? SystemMouseCursors.click
        : MouseCursor.defer);
  }

  Gradient? gradient(ShadcnThemeData theme) {
    return widget.gradient ?? buttonTheme(theme).gradient;
  }

  List<BoxShadow>? shadows(ShadcnThemeData theme) {
    return widget.shadows ?? buttonTheme(theme).shadows;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    assertCheckHasTextOrIcon();

    final shadcnTheme = ShadcnTheme.of(context);

    final hasPressedBackgroundColor = widget.pressedBackgroundColor != null ||
        buttonTheme(shadcnTheme).pressedBackgroundColor != null;
    final hasPressedForegroundColor = widget.pressedForegroundColor != null ||
        buttonTheme(shadcnTheme).pressedForegroundColor != null;

    final trackPressState =
        hasPressedForegroundColor || hasPressedBackgroundColor;

    final applyIconColorFilter = widget.applyIconColorFilter ??
        shadcnTheme.primaryButtonTheme.applyIconColorFilter;

    final effectiveDecoration = widget.decoration ??
        buttonTheme(shadcnTheme).decoration ??
        shadcnTheme.decoration;

    // Applies the foreground color filter to the icon if provided
    var icon = widget.icon;
    if (icon != null && applyIconColorFilter) {
      icon = ColorFiltered(
        colorFilter: ColorFilter.mode(
          foreground(shadcnTheme),
          BlendMode.srcIn,
        ),
        child: icon,
      );
    }

    return Semantics(
      container: true,
      button: true,
      focusable: enabled,
      enabled: enabled,
      child: Opacity(
        opacity: enabled ? 1 : .5,
        child: AbsorbPointer(
          absorbing: !enabled,
          child: ShadFocused(
            canRequestFocus: enabled,
            autofocus: widget.autofocus,
            focusNode: focusNode,
            builder: (context, focused, child) => ShadcnDecorator(
              decoration: effectiveDecoration,
              focused: focused,
              child: child!,
            ),
            child: MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
              cursor: cursor(shadcnTheme),
              child: GestureDetector(
                onTap: widget.onPressed == null
                    ? null
                    : () {
                        widget.onPressed!();
                        if (!focusNode.hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                onTapDown: (_) {
                  if (!trackPressState) return;
                  isPressed.value = true;
                },
                onTapUp: (_) {
                  if (!trackPressState) return;
                  isPressed.value = false;
                },
                onTapCancel: () {
                  if (!trackPressState) return;
                  isPressed.value = false;
                },
                child: ValueListenableBuilder(
                  valueListenable: isHovered,
                  builder: (context, hovered, child) {
                    return ValueListenableBuilder(
                      valueListenable: isPressed,
                      builder: (context, pressed, _) {
                        return Container(
                          height: height(shadcnTheme),
                          width: width(shadcnTheme),
                          decoration: BoxDecoration(
                            color: hasPressedBackgroundColor && pressed
                                ? pressedBackgroundColor(shadcnTheme)
                                : hovered
                                    ? hoverBackground(shadcnTheme)
                                    : background(shadcnTheme),
                            borderRadius: borderRadius(shadcnTheme),
                            border: border(shadcnTheme),
                            gradient: gradient(shadcnTheme),
                            boxShadow: shadows(shadcnTheme),
                          ),
                          padding: padding(shadcnTheme),
                          child: child,
                        );
                      },
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
                                return ValueListenableBuilder(
                                  valueListenable: isPressed,
                                  builder: (context, pressed, child) {
                                    return DefaultTextStyle(
                                      style:
                                          shadcnTheme.textTheme.small.copyWith(
                                        color: hasPressedForegroundColor &&
                                                pressed
                                            ? pressedForegroundColor(
                                                shadcnTheme,
                                              )
                                            : hovered
                                                ? hoverForeground(shadcnTheme)
                                                : foreground(shadcnTheme),
                                        decoration: textDecoration(
                                          shadcnTheme,
                                          hovered: hovered,
                                        ),
                                        decorationColor:
                                            foreground(shadcnTheme),
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                      textAlign: TextAlign.center,
                                      child: widget.text!,
                                    );
                                  },
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
          ),
        ),
      ),
    );
  }
}
