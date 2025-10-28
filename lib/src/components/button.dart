import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/button_sizes.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// Variants available for the [ShadButton] widget.
enum ShadButtonVariant {
  primary,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

/// Size options available for the [ShadButton] widget.
enum ShadButtonSize {
  regular,
  sm,
  lg,
}

/// A highly customizable button widget with variant and size options.
///
/// The [ShadButton] widget provides a flexible button with multiple styling
/// variants (primary, destructive, outline, secondary, ghost, link) and sizes
/// (regular, small, large).
/// It supports rich interaction states (hover, press, focus) and can include leading/trailing
/// widgets alongside text. Use named constructors for specific variants or
/// [ShadButton.raw] for full control.
class ShadButton extends StatefulWidget {
  /// Creates a primary variant button widget.
  const ShadButton({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.primary;

  /// Creates a button widget with a specified [variant], allowing full control
  /// over configuration.
  const ShadButton.raw({
    super.key,
    required this.variant,
    this.size,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  });

  /// Creates a destructive variant button widget, typically for warning or
  /// error actions.
  const ShadButton.destructive({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.destructive;

  /// Creates an outline variant button widget, typically with a bordered
  /// appearance.
  const ShadButton.outline({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.outline;

  /// Creates a secondary variant button widget, typically for less prominent
  /// actions.
  const ShadButton.secondary({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.secondary;

  /// Creates a ghost variant button widget, typically with minimal styling.
  const ShadButton.ghost({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.ghost;

  /// Creates a link variant button widget, styled like a hyperlink.
  const ShadButton.link({
    super.key,
    required this.child,
    this.onPressed,
    this.size,
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
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.expands,
    this.leading,
    this.trailing,
    this.textStyle,
    this.canRequestFocus,
  }) : variant = ShadButtonVariant.link;

  /// {@template ShadButton.onPressed}
  /// The callback invoked when the button is tapped.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template ShadButton.onLongPress}
  /// The callback invoked when the button is long-pressed, adding long-press
  /// functionality if provided. Controlled by [longPressDuration] for timing.
  /// {@endtemplate}
  final VoidCallback? onLongPress;

  /// {@template ShadButton.leading}
  /// The widget displayed before the main [child], typically an icon or small
  /// graphic. Positioned according to [mainAxisAlignment] and [textDirection].
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadButton.child}
  /// The main content widget of the button, typically a [Text] widget.
  /// Styled with the foreground color and theme text styles.
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadButton.trailing}
  /// The widget displayed after the main [child], typically an icon or small
  /// graphic. Positioned according to [mainAxisAlignment] and [textDirection].
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadButton.variant}
  /// The variant of the button, one of [ShadButtonVariant] options (primary,
  /// destructive, etc.). Determines the visual style applied through the
  /// [ShadTheme].
  /// {@endtemplate}
  final ShadButtonVariant variant;

  /// {@template ShadButton.size}
  /// The size of the button, one of [ShadButtonSize] options (regular, sm, lg).
  /// Affects dimensions and padding unless overridden by [width], [height], or
  /// [padding].
  /// {@endtemplate}
  final ShadButtonSize? size;

  /// {@template ShadButton.cursor}
  /// The mouse cursor displayed over the button, overriding the theme default
  /// if specified. Typically [SystemMouseCursors.click] when enabled.
  /// {@endtemplate}
  final MouseCursor? cursor;

  /// {@template ShadButton.width}
  /// The explicit width of the button, overriding size-based defaults if
  /// specified. Falls back to theme or size-specific values if null.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadButton.height}
  /// The explicit height of the button, overriding size-based defaults if
  /// specified. Falls back to theme or size-specific values if null.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadButton.padding}
  /// Padding around the button's content, overriding size-based defaults
  /// if specified. Controls internal spacing within the button.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadButton.backgroundColor}
  /// The background color of the button when not hovered or pressed, overriding
  /// the theme default if provided. Changes based on [variant] if not
  /// explicitly set.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadButton.hoverBackgroundColor}
  /// The background color of the button when hovered, overriding the theme
  /// default if provided.
  /// Applied during mouse hover for visual feedback.
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@template ShadButton.foregroundColor}
  /// The color of the button's content (e.g., text, icons) when not hovered or
  /// pressed.
  /// Overrides the theme default if provided; required in theme if not set.
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template ShadButton.hoverForegroundColor}
  /// The color of the button's content when hovered, overriding the theme
  /// default if provided.
  /// Applied during mouse hover for visual feedback.
  /// {@endtemplate}
  final Color? hoverForegroundColor;

  /// {@template ShadButton.autofocus}
  /// Whether the button should automatically receive focus when the widget is
  /// built. Defaults to false; managed by [focusNode].
  /// {@endtemplate}
  final bool autofocus;

  /// {@template ShadButton.focusNode}
  /// The focus node for keyboard navigation, created internally if not
  /// provided. Enables focus handling and shortcuts like Enter key activation.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadButton.pressedBackgroundColor}
  /// The background color of the button when pressed, overriding the theme
  /// default if provided. Applied during tap or long-press interactions.
  /// {@endtemplate}
  final Color? pressedBackgroundColor;

  /// {@template ShadButton.pressedForegroundColor}
  /// The foreground color of the button when pressed, overriding the theme
  /// default if provided. Applied to content during tap or long-press
  /// interactions.
  /// {@endtemplate}
  final Color? pressedForegroundColor;

  /// {@template ShadButton.shadows}
  /// The list of box shadows applied to the button, overriding the theme
  /// default if provided. Enhances visual depth and elevation.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadButton.gradient}
  /// The gradient applied to the button's background, overriding the theme
  /// default if provided. Supersedes [backgroundColor] if both are set.
  /// {@endtemplate}
  final Gradient? gradient;

  /// {@template ShadButton.textDecoration}
  /// The text decoration applied to the button's text when not hovered,
  /// overriding the theme default if provided. E.g., [TextDecoration.underline]
  /// for styling.
  /// {@endtemplate}
  final TextDecoration? textDecoration;

  /// {@template ShadButton.hoverTextDecoration}
  /// The text decoration applied to the button's text when hovered, overriding
  /// the theme default if provided. Applied during mouse hover for visual
  /// feedback.
  /// {@endtemplate}
  final TextDecoration? hoverTextDecoration;

  /// {@template ShadButton.decoration}
  /// Custom decoration for the button, merged with theme defaults if provided.
  /// Allows advanced styling beyond basic colors and shadows.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadButton.enabled}
  /// Whether the button is interactive, defaults to true.
  /// If false, the button is disabled, visually dimmed, and non-responsive.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadButton.statesController}
  /// The controller for managing button states (e.g., hovered, pressed,
  /// focused). If null, an internal controller is created.
  /// {@endtemplate}
  final ShadStatesController? statesController;

  /// {@template ShadButton.gap}
  /// The gap between the button's items (e.g., [leading], [child], [trailing]).
  /// Defaults to 8 pixels if not specified.
  /// {@endtemplate}
  final double? gap;

  /// {@template ShadButton.mainAxisAlignment}
  /// The main axis alignment of the button's content within its [Row].
  /// Defaults to [MainAxisAlignment.center] if not specified.
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template ShadButton.crossAxisAlignment}
  /// The cross axis alignment of the button's content within its [Row].
  /// Defaults to [CrossAxisAlignment.center] if not specified.
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@template ShadButton.hoverStrategies}
  /// The strategies for handling hover behavior, overriding the theme default
  /// if provided. Controls how hover states are detected and applied.
  /// {@endtemplate}
  final ShadHoverStrategies? hoverStrategies;

  /// {@template ShadButton.onHoverChange}
  /// Callback invoked when the hover state changes, providing the new hover
  /// value. Complements internal hover state management.
  /// {@endtemplate}
  final ValueChanged<bool>? onHoverChange;

  /// {@template ShadButton.onTapDown}
  /// Callback invoked when a tap begins, providing tap details.
  /// Triggers the pressed state visually.
  /// {@endtemplate}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@template ShadButton.onTapUp}
  /// Callback invoked when a tap ends, providing tap details.
  /// Ends the pressed state visually.
  /// {@endtemplate}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@template ShadButton.onTapCancel}
  /// Callback invoked when a tap is canceled.
  /// Resets the pressed state.
  /// {@endtemplate}
  final VoidCallback? onTapCancel;

  /// {@template ShadButton.onSecondaryTapDown}
  /// Callback invoked when a secondary (e.g., right-click) tap begins,
  /// providing tap details. For advanced gesture handling.
  /// {@endtemplate}
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// {@template ShadButton.onSecondaryTapUp}
  /// Callback invoked when a secondary tap ends, providing tap details.
  /// For advanced gesture handling.
  /// {@endtemplate}
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// {@template ShadButton.onSecondaryTapCancel}
  /// Callback invoked when a secondary tap is canceled.
  /// For advanced gesture handling.
  /// {@endtemplate}
  final VoidCallback? onSecondaryTapCancel;

  /// {@template ShadButton.onLongPressStart}
  /// Callback invoked when a long press begins, providing details.
  /// Part of long-press gesture handling.
  /// {@endtemplate}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@template ShadButton.onLongPressCancel}
  /// Callback invoked when a long press is canceled.
  /// Part of long-press gesture handling.
  /// {@endtemplate}
  final VoidCallback? onLongPressCancel;

  /// {@template ShadButton.onLongPressUp}
  /// Callback invoked when a long press ends by lifting.
  /// Part of long-press gesture handling.
  /// {@endtemplate}
  final VoidCallback? onLongPressUp;

  /// {@template ShadButton.onLongPressDown}
  /// Callback invoked when a long press is detected, providing details.
  /// Part of long-press gesture handling.
  /// {@endtemplate}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@template ShadButton.onLongPressEnd}
  /// Callback invoked when a long press ends, providing details.
  /// Part of long-press gesture handling.
  /// {@endtemplate}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@template ShadButton.onDoubleTap}
  /// Callback invoked when a double tap occurs.
  /// For advanced gesture handling.
  /// {@endtemplate}
  final VoidCallback? onDoubleTap;

  /// {@template ShadButton.onDoubleTapDown}
  /// Callback invoked when a double tap begins, providing details.
  /// For advanced gesture handling.
  /// {@endtemplate}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@template ShadButton.onDoubleTapCancel}
  /// Callback invoked when a double tap is canceled.
  /// For advanced gesture handling.
  /// {@endtemplate}
  final VoidCallback? onDoubleTapCancel;

  /// {@template ShadButton.longPressDuration}
  /// The duration required to trigger a long press, overriding the theme
  /// default if provided. Controls the timing of [onLongPress] and related
  /// callbacks.
  /// {@endtemplate}
  final Duration? longPressDuration;

  /// {@template ShadButton.textDirection}
  /// The text direction for the button's content, overriding the default if
  /// specified. Can be set to [TextDirection.ltr] or [TextDirection.rtl].
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadButton.onFocusChange}
  /// Callback invoked when the focus state changes, providing the new focus
  /// value. Complements internal focus state management.
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@template ShadButton.expands}
  /// Whether the [child] expands to fill available space along the main axis.
  /// Defaults to false if not specified.
  /// {@endtemplate}
  final bool? expands;

  /// {@template ShadButton.textStyle}
  /// The text style applied to the button's [child] when it is a [Text] widget,
  /// overriding the theme default if provided.
  /// Allows customization of font size, weight, and other text properties.
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadButton.canRequestFocus}
  /// Whether the button can request focus.
  /// Defaults to true if [enabled] is true, false otherwise.
  /// {@endtemplate}
  final bool? canRequestFocus;

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
    return defaultHeightForSize(
      theme,
      buttonTheme(theme).size ?? ShadButtonSize.regular,
    );
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
    return defaultWidthForSize(
      theme,
      buttonTheme(theme).size ?? ShadButtonSize.regular,
    );
  }

  EdgeInsetsGeometry defaultPaddingForSize(
    ShadThemeData theme,
    ShadButtonSize size,
  ) {
    return sizeTheme(theme, size).padding;
  }

  EdgeInsetsGeometry padding(ShadThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (widget.size != null) {
      return defaultPaddingForSize(theme, widget.size!);
    }
    return defaultPaddingForSize(
      theme,
      buttonTheme(theme).size ?? ShadButtonSize.regular,
    );
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
    final btnThemeHoverForegroundColor = buttonTheme(
      theme,
    ).hoverForegroundColor;
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
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final iconTheme = IconTheme.of(context);

    final hasPressedBackgroundColor =
        widget.pressedBackgroundColor != null ||
        buttonTheme(theme).pressedBackgroundColor != null;
    final hasPressedForegroundColor =
        widget.pressedForegroundColor != null ||
        buttonTheme(theme).pressedForegroundColor != null;

    final effectiveDecoration =
        (buttonTheme(theme).decoration ?? const ShadDecoration()).merge(
          widget.decoration,
        );

    final effectiveMainAxisAlignment =
        widget.mainAxisAlignment ??
        buttonTheme(theme).mainAxisAlignment ??
        MainAxisAlignment.center;

    final effectiveCrossAxisAlignment =
        widget.crossAxisAlignment ??
        buttonTheme(theme).crossAxisAlignment ??
        CrossAxisAlignment.center;

    final effectiveLongPressDuration =
        widget.longPressDuration ?? buttonTheme(theme).longPressDuration;

    final effectiveHoverStrategies =
        widget.hoverStrategies ??
        buttonTheme(theme).hoverStrategies ??
        theme.hoverStrategies;

    final effectiveTextDirection =
        widget.textDirection ?? buttonTheme(theme).textDirection;

    final effectiveGap = widget.gap ?? buttonTheme(theme).gap ?? 8;

    final effectiveExpands =
        widget.expands ?? buttonTheme(theme).expands ?? false;

    final effectiveCanRequestFocus = widget.canRequestFocus ?? widget.enabled;

    final keyboardTriggers = <ShortcutActivator>[
      const SingleActivator(LogicalKeyboardKey.enter),
      const SingleActivator(LogicalKeyboardKey.space),
    ];

    final effectiveTextStyle =
        widget.textStyle ??
        buttonTheme(theme).textStyle ??
        theme.textTheme.small;

    return CallbackShortcuts(
      bindings: {
        for (final trigger in keyboardTriggers)
          trigger: () {
            if (!widget.enabled) return;
            onTap();
          },
      },
      child: ValueListenableBuilder(
        valueListenable: statesController,
        builder: (context, states, _) {
          final pressed = states.contains(ShadState.pressed);
          final hovered = states.contains(ShadState.hovered);
          final enabled = !states.contains(ShadState.disabled);

          final effectiveBackgroundColor = hasPressedBackgroundColor && pressed
              ? pressedBackgroundColor(theme)
              : hovered
              ? hoverBackground(theme)
              : background(theme);

          final effectiveForegroundColor = hasPressedForegroundColor && pressed
              ? pressedForegroundColor(theme)
              : hovered
              ? hoverForeground(theme)
              : foreground(theme);

          final updatedDecoration = effectiveDecoration.copyWith(
            color: effectiveBackgroundColor,
            gradient: gradient(theme),
            shadows: shadows(theme),
          );

          var child = widget.child;

          if (widget.child != null && effectiveExpands) {
            child = Expanded(child: widget.child!);
          }

          return IconTheme(
            data: iconTheme.copyWith(color: effectiveForegroundColor),
            child: DefaultTextStyle(
              style: effectiveTextStyle.copyWith(
                color: effectiveForegroundColor,
                decoration: textDecoration(
                  theme,
                  hovered: hovered,
                ),
                decorationColor: foreground(theme),
                decorationStyle: TextDecorationStyle.solid,
              ),
              textAlign: TextAlign.center,
              child: Semantics(
                container: true,
                button: true,
                focusable: enabled,
                enabled: enabled,
                child: Opacity(
                  opacity: enabled ? 1 : .5,
                  child: AbsorbPointer(
                    absorbing: !enabled,
                    child: ShadFocusable(
                      canRequestFocus: effectiveCanRequestFocus,
                      autofocus: widget.autofocus,
                      focusNode: focusNode,
                      onFocusChange: widget.onFocusChange,
                      builder: (context, focused, child) => ShadDecorator(
                        decoration: updatedDecoration,
                        focused: focused,
                        child: child,
                      ),
                      child: ShadGestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onHoverChange: (value) {
                          statesController.update(ShadState.hovered, value);
                          widget.onHoverChange?.call(value);
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
                        onSecondaryTapDown: (details) {
                          widget.onSecondaryTapDown?.call(details);
                        },
                        onSecondaryTapUp: (details) {
                          widget.onSecondaryTapUp?.call(details);
                        },
                        onSecondaryTapCancel: () {
                          widget.onSecondaryTapCancel?.call();
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
                        child: SelectionContainer.disabled(
                          child: SizedBox(
                            height: height(theme),
                            width: width(theme),
                            child: Padding(
                              padding: padding(theme),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: effectiveCrossAxisAlignment,
                                mainAxisAlignment: effectiveMainAxisAlignment,
                                textDirection: effectiveTextDirection,
                                children: [
                                  ?widget.leading,
                                  ?child,
                                  ?widget.trailing,
                                ].separatedBy(SizedBox(width: effectiveGap)),
                              ),
                            ),
                          ),
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
