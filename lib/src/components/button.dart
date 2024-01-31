import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/focused.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';

enum ShadButtonVariant {
  primary,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum ShadButtonSize {
  regular,
  sm,
  lg,
  icon,
}

class ShadButton extends StatefulWidget {
  const ShadButton({
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
  }) : variant = ShadButtonVariant.primary;

  const ShadButton.raw({
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

  const ShadButton.destructive({
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
  }) : variant = ShadButtonVariant.destructive;

  const ShadButton.outline({
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
  }) : variant = ShadButtonVariant.outline;

  const ShadButton.secondary({
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
  }) : variant = ShadButtonVariant.secondary;

  const ShadButton.ghost({
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
  }) : variant = ShadButtonVariant.ghost;

  const ShadButton.link({
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
  })  : variant = ShadButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;
  final ShadButtonVariant variant;
  final ShadButtonSize? size;
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
  final ShadDecorationTheme? decoration;

  @override
  State<ShadButton> createState() => _ShadButtonState();
}

class _ShadButtonState extends State<ShadButton> {
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

  ShadButtonTheme buttonTheme(ShadThemeData theme) {
    return switch (widget.variant) {
      ShadButtonVariant.primary => theme.primaryButtonTheme,
      ShadButtonVariant.destructive => theme.destructiveButtonTheme,
      ShadButtonVariant.secondary => theme.secondaryButtonTheme,
      ShadButtonVariant.ghost => theme.ghostButtonTheme,
      ShadButtonVariant.outline => theme.outlineButtonTheme,
      ShadButtonVariant.link => theme.linkButtonTheme,
    };
  }

  ShadButtonSizeTheme sizeTheme(
    ShadThemeData theme,
    ShadButtonSize size,
  ) {
    switch (size) {
      case ShadButtonSize.sm:
        return buttonTheme(theme).sizesTheme?.sm ?? theme.buttonSizesTheme.sm!;
      case ShadButtonSize.lg:
        return buttonTheme(theme).sizesTheme?.lg ?? theme.buttonSizesTheme.lg!;
      case ShadButtonSize.icon:
        return buttonTheme(theme).sizesTheme?.icon ??
            theme.buttonSizesTheme.icon!;
      case ShadButtonSize.regular:
        return buttonTheme(theme).sizesTheme?.regular ??
            theme.buttonSizesTheme.regular!;
    }
  }

  double defaultHeightForSize(ShadThemeData theme, ShadButtonSize size) {
    return sizeTheme(theme, size).height;
  }

  double height(ShadThemeData theme) {
    if (widget.height != null) return widget.height!;
    if (widget.size != null) {
      return defaultHeightForSize(theme, widget.size!);
    }
    return defaultHeightForSize(theme, buttonTheme(theme).size);
  }

  double? defaultWidthForSize(ShadThemeData theme, ShadButtonSize size) {
    return sizeTheme(theme, size).width;
  }

  double? width(ShadThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (widget.size != null) {
      return defaultWidthForSize(theme, widget.size!);
    }
    return defaultWidthForSize(theme, buttonTheme(theme).size);
  }

  EdgeInsets defaultPaddingForSize(
    ShadThemeData theme,
    ShadButtonSize size,
  ) {
    return sizeTheme(theme, size).padding;
  }

  EdgeInsets padding(ShadThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (widget.size != null) {
      return defaultPaddingForSize(theme, widget.size!);
    }
    return defaultPaddingForSize(theme, buttonTheme(theme).size);
  }

  Color? background(ShadThemeData theme) {
    return widget.backgroundColor ?? buttonTheme(theme).backgroundColor;
  }

  Color? hoverBackground(ShadThemeData theme) {
    return widget.hoverBackgroundColor ??
        buttonTheme(theme).hoverBackgroundColor;
  }

  Color foreground(ShadThemeData theme) {
    if (widget.foregroundColor != null) return widget.foregroundColor!;

    final btnThemeForegroundColor = buttonTheme(theme).foregroundColor;
    assert(
      btnThemeForegroundColor != null,
      'Button foregroundColor is null in ShadButtonTheme',
    );
    return buttonTheme(theme).foregroundColor!;
  }

  Color hoverForeground(ShadThemeData theme) {
    if (widget.hoverForegroundColor != null) {
      return widget.hoverForegroundColor!;
    }
    final btnThemeHoverForegroundColor =
        buttonTheme(theme).hoverForegroundColor;
    assert(
      btnThemeHoverForegroundColor != null,
      'Button hoverForegroundColor is null in ShadButtonTheme',
    );
    return buttonTheme(theme).hoverForegroundColor!;
  }

  Color pressedBackgroundColor(ShadThemeData theme) {
    return widget.pressedBackgroundColor ??
        buttonTheme(theme).pressedBackgroundColor!;
  }

  Color pressedForegroundColor(ShadThemeData theme) {
    return widget.pressedForegroundColor ??
        buttonTheme(theme).pressedForegroundColor!;
  }

  TextDecoration? textDecoration(
    ShadThemeData theme, {
    required bool hovered,
  }) {
    if (hovered) {
      return widget.hoverTextDecoration ??
          buttonTheme(theme).hoverTextDecoration;
    }
    return widget.textDecoration ?? buttonTheme(theme).textDecoration;
  }

  BoxBorder? border(ShadThemeData theme) {
    return widget.border ?? buttonTheme(theme).border;
  }

  BorderRadius borderRadius(ShadThemeData theme) {
    return widget.borderRadius ?? buttonTheme(theme).radius ?? theme.radius;
  }

  MouseCursor cursor(ShadThemeData theme) {
    if (widget.cursor != null) return widget.cursor!;
    return (enabled
        ? buttonTheme(theme).cursor ?? SystemMouseCursors.click
        : MouseCursor.defer);
  }

  Gradient? gradient(ShadThemeData theme) {
    return widget.gradient ?? buttonTheme(theme).gradient;
  }

  List<BoxShadow>? shadows(ShadThemeData theme) {
    return widget.shadows ?? buttonTheme(theme).shadows;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    assertCheckHasTextOrIcon();

    final theme = ShadTheme.of(context);

    final hasPressedBackgroundColor = widget.pressedBackgroundColor != null ||
        buttonTheme(theme).pressedBackgroundColor != null;
    final hasPressedForegroundColor = widget.pressedForegroundColor != null ||
        buttonTheme(theme).pressedForegroundColor != null;

    final trackPressState =
        hasPressedForegroundColor || hasPressedBackgroundColor;

    final applyIconColorFilter = widget.applyIconColorFilter ??
        theme.primaryButtonTheme.applyIconColorFilter;

    final effectiveDecoration =
        widget.decoration ?? buttonTheme(theme).decoration ?? theme.decoration;

    // Applies the foreground color filter to the icon if provided
    var icon = widget.icon;
    if (icon != null && applyIconColorFilter) {
      icon = ColorFiltered(
        colorFilter: ColorFilter.mode(
          foreground(theme),
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
            builder: (context, focused, child) => ShadDecorator(
              decoration: effectiveDecoration,
              focused: focused,
              child: child!,
            ),
            child: MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
              cursor: cursor(theme),
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
                          height: height(theme),
                          width: width(theme),
                          decoration: BoxDecoration(
                            color: hasPressedBackgroundColor && pressed
                                ? pressedBackgroundColor(theme)
                                : hovered
                                    ? hoverBackground(theme)
                                    : background(theme),
                            borderRadius: borderRadius(theme),
                            border: border(theme),
                            gradient: gradient(theme),
                            boxShadow: shadows(theme),
                          ),
                          padding: padding(theme),
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
                                      style: theme.textTheme.small.copyWith(
                                        color:
                                            hasPressedForegroundColor && pressed
                                                ? pressedForegroundColor(
                                                    theme,
                                                  )
                                                : hovered
                                                    ? hoverForeground(theme)
                                                    : foreground(theme),
                                        decoration: textDecoration(
                                          theme,
                                          hovered: hovered,
                                        ),
                                        decorationColor: foreground(theme),
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
