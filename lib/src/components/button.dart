import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

typedef FocusWidgetBuilder = Widget Function(
  BuildContext context,
  bool focused,
  Widget child,
);

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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  }) : variant = ShadcnButtonVariant.$default;

  const ShadcnButton.raw({
    super.key,
    required this.variant,
    required this.size,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  });

  const ShadcnButton.destructive({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  }) : variant = ShadcnButtonVariant.destructive;

  const ShadcnButton.outline({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  }) : variant = ShadcnButtonVariant.outline;

  const ShadcnButton.secondary({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  }) : variant = ShadcnButtonVariant.secondary;

  const ShadcnButton.ghost({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  }) : variant = ShadcnButtonVariant.ghost;

  const ShadcnButton.link({
    super.key,
    required this.text,
    this.onPressed,
    this.size = ShadcnButtonSize.$default,
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
    this.boxShadow,
    this.gradient,
    this.focusBuilder,
  })  : variant = ShadcnButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final ShadcnButtonVariant variant;
  final ShadcnButtonSize size;

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
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final FocusWidgetBuilder? focusBuilder;

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

  ShadcnButtonTheme? buttonTheme(ShadcnThemeData theme) {
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primaryButtonTheme,
      ShadcnButtonVariant.destructive => theme.destructiveButtonTheme,
      ShadcnButtonVariant.secondary => theme.secondaryButtonTheme,
      ShadcnButtonVariant.ghost => theme.ghostButtonTheme,
      ShadcnButtonVariant.outline => theme.outlineButtonTheme,
      ShadcnButtonVariant.link => theme.linkButtonTheme,
    };
  }

  double height(ShadcnThemeData theme) {
    if (widget.height != null) return widget.height!;
    if (buttonTheme(theme)?.height != null) {
      return buttonTheme(theme)!.height!;
    }
    return switch (widget.size) {
      ShadcnButtonSize.$default => 40,
      ShadcnButtonSize.sm => 36,
      ShadcnButtonSize.lg => 44,
      ShadcnButtonSize.icon => 40,
    };
  }

  double? width(ShadcnThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (buttonTheme(theme)?.width != null) {
      return buttonTheme(theme)!.width!;
    }
    return switch (widget.size) {
      ShadcnButtonSize.icon => 40,
      _ => null,
    };
  }

  EdgeInsets padding(ShadcnThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (buttonTheme(theme)?.padding != null) {
      return buttonTheme(theme)!.padding!;
    }
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
    if (buttonTheme(theme)?.backgroundColor != null) {
      return buttonTheme(theme)!.backgroundColor!;
    }

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
    if (buttonTheme(theme)?.hoverBackgroundColor != null) {
      return buttonTheme(theme)!.hoverBackgroundColor!;
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
    if (buttonTheme(theme)?.foregroundColor != null) {
      return buttonTheme(theme)!.foregroundColor!;
    }
    return switch (widget.variant) {
      ShadcnButtonVariant.$default => theme.primaryForeground,
      ShadcnButtonVariant.destructive => theme.destructiveForeground,
      ShadcnButtonVariant.outline => theme.accentForeground,
      ShadcnButtonVariant.secondary => theme.secondaryForeground,
      ShadcnButtonVariant.link => theme.primary,
      ShadcnButtonVariant.ghost => theme.primary,
    };
  }

  Color pressedBackgroundColor(ShadcnThemeData theme) {
    if (widget.pressedBackgroundColor != null) {
      return widget.pressedBackgroundColor!;
    }
    return buttonTheme(theme)!.pressedBackgroundColor!;
  }

  Color pressedForegroundColor(ShadcnThemeData theme) {
    if (widget.pressedForegroundColor != null) {
      return widget.pressedForegroundColor!;
    }
    return buttonTheme(theme)!.pressedForegroundColor!;
  }

  Color hoverForeground(ShadcnThemeData theme) {
    if (widget.hoverForegroundColor != null) {
      return widget.hoverForegroundColor!;
    }
    if (buttonTheme(theme)?.hoverForegroundColor != null) {
      return buttonTheme(theme)!.hoverForegroundColor!;
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

  TextDecoration? textDecoration(
    ShadcnThemeData theme, {
    required bool hovered,
  }) {
    if (buttonTheme(theme)?.textDecoration != null) {
      return buttonTheme(theme)!.textDecoration!;
    }
    return switch (widget.variant) {
      ShadcnButtonVariant.link => hovered ? TextDecoration.underline : null,
      _ => null,
    };
  }

  BoxBorder? border(ShadcnThemeData theme) {
    if (widget.border != null) return widget.border!;
    if (buttonTheme(theme)?.border != null) {
      return buttonTheme(theme)!.border!;
    }
    return switch (widget.variant) {
      ShadcnButtonVariant.outline => Border.all(color: theme.input),
      _ => null,
    };
  }

  BorderRadius borderRadius(ShadcnThemeData theme) {
    if (widget.borderRadius != null) return widget.borderRadius!;
    if (buttonTheme(theme)?.borderRadius != null) {
      return buttonTheme(theme)!.borderRadius!;
    }
    return const BorderRadius.all(Radius.circular(6));
  }

  MouseCursor cursor(ShadcnThemeData theme) {
    if (widget.cursor != null) return widget.cursor!;
    return (enabled
        ? buttonTheme(theme)?.cursor ?? SystemMouseCursors.click
        : MouseCursor.defer);
  }

  Gradient? gradient(ShadcnThemeData theme) {
    if (widget.gradient != null) return widget.gradient!;
    return buttonTheme(theme)?.gradient;
  }

  List<BoxShadow>? boxShadow(ShadcnThemeData theme) {
    if (widget.boxShadow != null) return widget.boxShadow!;
    return buttonTheme(theme)?.boxShadow;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadcnTheme(context));
    assertCheckHasTextOrIcon();

    final shadcnTheme = ShadcnTheme.of(context);

    final hasPressedBackgroundColor = widget.pressedBackgroundColor != null ||
        buttonTheme(shadcnTheme)?.pressedBackgroundColor != null;
    final hasPressedForegroundColor = widget.pressedForegroundColor != null ||
        buttonTheme(shadcnTheme)?.pressedForegroundColor != null;

    final trackPressState =
        hasPressedForegroundColor || hasPressedBackgroundColor;

    final applyIconColorFilter = widget.applyIconColorFilter ??
        shadcnTheme.primaryButtonTheme?.applyIconColorFilter ??
        true;

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
                if (buttonTheme(shadcnTheme)?.focusBuilder != null) {
                  return buttonTheme(shadcnTheme)!.focusBuilder!(
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
                      color: shadcnTheme.ring,
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
                              boxShadow: boxShadow(shadcnTheme),
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
