import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/components/focused.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
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
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  })  : variant = ShadButtonVariant.link,
        icon = null;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
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
  final ShadDecoration? decoration;
  final bool enabled;
  final ShadStatesController? statesController;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  State<ShadButton> createState() => _ShadButtonState();
}

class _ShadButtonState extends State<ShadButton> {
  ShadStatesController? _statesController;
  FocusNode? _focusNode;

  ShadStatesController get statesController =>
      widget.statesController ?? _statesController!;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.statesController == null) {
      _statesController = ShadStatesController();
    }
    if (widget.focusNode == null) _focusNode = FocusNode();
    statesController.update(ShadState.disabled, !widget.enabled);
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant ShadButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      statesController.update(ShadState.disabled, !widget.enabled);
    }
  }

  @override
  void dispose() {
    _statesController?.dispose();
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
    super.dispose();
  }

  void onFocusChange() {
    statesController.update(ShadState.focused, focusNode.hasFocus);
  }

  void assertCheckHasTextOrIcon() {
    assert(
      widget.text != null || widget.icon != null,
      'Either text or icon must be provided',
    );
  }

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
    if (buttonTheme(theme).height != null) {
      return buttonTheme(theme).height!;
    }
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
    if (buttonTheme(theme).width != null) {
      return buttonTheme(theme).width!;
    }
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
    return (widget.enabled
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

    final applyIconColorFilter = widget.applyIconColorFilter ??
        theme.primaryButtonTheme.applyIconColorFilter;

    final effectiveDecoration =
        widget.decoration ?? buttonTheme(theme).decoration ?? theme.decoration;

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        buttonTheme(theme).mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        buttonTheme(theme).crossAxisAlignment ??
        CrossAxisAlignment.center;

    return ValueListenableBuilder(
      valueListenable: statesController,
      builder: (context, states, _) {
        final pressed = states.contains(ShadState.pressed);
        final hovered = states.contains(ShadState.hovered);
        final enabled = !states.contains(ShadState.disabled);

        // Applies the foreground color filter to the icon if provided
        var icon = widget.icon;
        if (icon != null && applyIconColorFilter) {
          icon = ColorFiltered(
            colorFilter: ColorFilter.mode(
              hasPressedForegroundColor && pressed
                  ? pressedForegroundColor(theme)
                  : hovered
                      ? hoverForeground(theme)
                      : foreground(theme),
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
                child: ShadGestureDetector(
                  onHoverChange: (value) {
                    statesController.update(ShadState.hovered, value);
                  },
                  cursor: cursor(theme),
                  onLongPress: widget.onLongPress,
                  onTap: widget.onPressed == null
                      ? null
                      : () {
                          if (!focusNode.hasFocus) {
                            FocusScope.of(context).unfocus();
                          }
                          widget.onPressed!();
                        },
                  onTapDown: (_) {
                    statesController.update(ShadState.pressed, true);
                  },
                  onTapUp: (_) {
                    statesController.update(ShadState.pressed, false);
                  },
                  onTapCancel: () {
                    statesController.update(ShadState.pressed, false);
                  },
                  child: Container(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: effectiveCrossAxisAlignment,
                      mainAxisAlignment: effectiveMainAxisAlignment,
                      children: [
                        if (icon != null) icon,
                        if (widget.text != null)
                          DefaultTextStyle(
                            style: theme.textTheme.small.copyWith(
                              color: hasPressedForegroundColor && pressed
                                  ? pressedForegroundColor(theme)
                                  : hovered
                                      ? hoverForeground(theme)
                                      : foreground(theme),
                              decoration: textDecoration(
                                theme,
                                hovered: hovered,
                              ),
                              decorationColor: foreground(theme),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                            textAlign: TextAlign.center,
                            child: widget.text!,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
