import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
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

  /// {@template ShadButton.mainAxisAlignment}
  /// The main axis alignment of the button.
  ///
  /// Defaults to [MainAxisAlignment.center]
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadButton.crossAxisAlignment}
  /// The cross axis alignment of the button.
  ///
  /// Defaults to [CrossAxisAlignment.center]
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  final ShadHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final VoidCallback? onDoubleTapCancel;
  final Duration? longPressDuration;

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
    if (oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
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

  void onTap() {
    if (widget.onPressed == null) return;
    if (!focusNode.hasFocus) FocusScope.of(context).unfocus();
    widget.onPressed!();
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
        (buttonTheme(theme).decoration ?? const ShadDecoration())
            .mergeWith(widget.decoration);

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        buttonTheme(theme).mainAxisAlignment ??
        MainAxisAlignment.center;

    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        buttonTheme(theme).crossAxisAlignment ??
        CrossAxisAlignment.center;

    final effectiveLongPressDuration =
        widget.longPressDuration ?? buttonTheme(theme).longPressDuration;

    final effectiveHoverStrategies = widget.hoverStrategies ??
        buttonTheme(theme).hoverStrategies ??
        theme.hoverStrategies;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.enter): onTap,
      },
      child: ValueListenableBuilder(
        valueListenable: statesController,
        builder: (context, states, _) {
          final pressed = states.contains(ShadState.pressed);
          final hovered = states.contains(ShadState.hovered);
          final enabled = !states.contains(ShadState.disabled);

          final updatedDecoration = effectiveDecoration.copyWith(
            color: hasPressedBackgroundColor && pressed
                ? pressedBackgroundColor(theme)
                : hovered
                    ? hoverBackground(theme)
                    : background(theme),
            gradient: gradient(theme),
            shadows: shadows(theme),
          );

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
                child: ShadFocusable(
                  canRequestFocus: enabled,
                  autofocus: widget.autofocus,
                  focusNode: focusNode,
                  builder: (context, focused, child) => ShadDecorator(
                    decoration: updatedDecoration,
                    focused: focused,
                    child: child,
                  ),
                  child: ShadGestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onHoverChange: (value) {
                      statesController.update(ShadState.hovered, value);
                    },
                    hoverStrategies: effectiveHoverStrategies,
                    cursor: cursor(theme),
                    onLongPress: widget.onLongPress,
                    onTap: widget.onPressed == null ? null : onTap,
                    onTapDown: (details) {
                      statesController.update(ShadState.pressed, true);
                      widget.onTapDown?.call(details);
                    },
                    onTapUp: (details) {
                      statesController.update(ShadState.pressed, false);
                      widget.onTapUp?.call(details);
                    },
                    onTapCancel: () {
                      statesController.update(ShadState.pressed, false);
                      widget.onTapCancel?.call();
                    },
                    onDoubleTap: widget.onDoubleTap,
                    onDoubleTapDown: widget.onDoubleTapDown,
                    onDoubleTapCancel: widget.onDoubleTapCancel,
                    onLongPressCancel: widget.onLongPressCancel,
                    onLongPressEnd: widget.onLongPressEnd,
                    onLongPressUp: widget.onLongPressUp,
                    onLongPressDown: widget.onLongPressDown,
                    onLongPressStart: widget.onLongPressStart,
                    longPressDuration: effectiveLongPressDuration,
                    child: SizedBox(
                      height: height(theme),
                      width: width(theme),
                      child: Padding(
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
            ),
          );
        },
      ),
    );
  }
}
