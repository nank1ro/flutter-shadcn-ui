import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

typedef FocusWidgetBuilder = Widget Function(
  BuildContext context,
  bool focused,
  Widget child,
);

enum ShadcnButtonVariant {
  primary,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
    this.focusBuilder,
    this.textDecoration,
    this.hoverTextDecoration,
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
  final FocusWidgetBuilder? focusBuilder;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;

  @override
  State<ShadcnButton> createState() => _ShadcnButtonState();
}

class _ShadcnButtonState extends State<ShadcnButton> {
  final isHovered = ValueNotifier(false);
  final isFocused = ValueNotifier(false);
  final isPressed = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    isFocused.dispose();
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

  double defaultHeightForSize(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.$default => 40,
      ShadcnButtonSize.sm => 36,
      ShadcnButtonSize.lg => 44,
      ShadcnButtonSize.icon => 40,
    };
  }

  double height(ShadcnThemeData theme) {
    if (widget.height != null) return widget.height!;
    if (widget.size != null) {
      return defaultHeightForSize(widget.size!);
    }
    if (buttonTheme(theme).height != null) {
      return buttonTheme(theme).height!;
    }
    return defaultHeightForSize(size(theme) ?? ShadcnButtonSize.$default);
  }

  double? defaultWidthForSize(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.icon => 40,
      _ => null,
    };
  }

  ShadcnButtonSize? size(ShadcnThemeData theme) {
    if (widget.size != null) return widget.size!;
    if (buttonTheme(theme).size != null) {
      return buttonTheme(theme).size!;
    }
    return null;
  }

  double? width(ShadcnThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (widget.size != null) {
      return defaultWidthForSize(widget.size!);
    }
    if (buttonTheme(theme).width != null) {
      return buttonTheme(theme).width!;
    }
    return defaultWidthForSize(size(theme) ?? ShadcnButtonSize.$default);
  }

  EdgeInsets defaultPaddingForSize(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.$default =>
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ShadcnButtonSize.sm => const EdgeInsets.symmetric(horizontal: 12),
      ShadcnButtonSize.lg =>
        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ShadcnButtonSize.icon => EdgeInsets.zero,
    };
  }

  EdgeInsets padding(ShadcnThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (size(theme) != null) {
      return defaultPaddingForSize(size(theme)!);
    }
    if (buttonTheme(theme).padding != null) {
      return buttonTheme(theme).padding!;
    }
    return defaultPaddingForSize(ShadcnButtonSize.$default);
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
      focused: isFocused.value,
      enabled: enabled,
      child: Opacity(
        opacity: enabled ? 1 : .5,
        child: AbsorbPointer(
          absorbing: !enabled,
          child: Focus(
            canRequestFocus: enabled,
            autofocus: widget.autofocus,
            focusNode: widget.focusNode,
            onFocusChange: (focused) => isFocused.value = focused,
            child: ValueListenableBuilder(
              valueListenable: isFocused,
              builder: (context, focused, child) {
                if (widget.focusBuilder != null) {
                  return widget.focusBuilder!(context, focused, child!);
                }
                if (buttonTheme(shadcnTheme).focusBuilder != null) {
                  return buttonTheme(shadcnTheme).focusBuilder!(
                    context,
                    focused,
                    child!,
                  );
                }
                if (!focused) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: child,
                  );
                }
                final br = borderRadius(shadcnTheme);
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: shadcnTheme.colorScheme.ring,
                      width: 2,
                    ),
                    borderRadius: br.add(br / 2),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: child,
                );
              },
              child: MouseRegion(
                onEnter: (_) => isHovered.value = true,
                onExit: (_) => isHovered.value = false,
                cursor: cursor(shadcnTheme),
                child: GestureDetector(
                  onTap: widget.onPressed,
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
                                        style: TextStyle(
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
      ),
    );
  }
}
