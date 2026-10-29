import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/button_sizes.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/toggle.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';

/// The variant of the [ShadToggle].
enum ShadToggleVariant { primary, outline }

/// {@template ShadToggle}
/// A two-state button that can be either on or off, styled according to the
/// Shadcn UI design system.
/// {@endtemplate}
class ShadToggle extends StatelessWidget {
  /// {@macro ShadToggle}
  const ShadToggle({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.child,
    this.leading,
    this.trailing,
    this.size,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.selectedBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.selectedForegroundColor,
    this.selectedHoverForegroundColor,
    this.shadows,
    this.decoration,
    this.cursor,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
    this.textStyle,
    this.gap,
    this.textDirection,
  }) : variant = ShadToggleVariant.primary,
       minWidth = null,
       mutuallyExclusive = false;

  /// {@macro ShadToggle}
  const ShadToggle.outline({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.child,
    this.leading,
    this.trailing,
    this.size,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.selectedBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.selectedForegroundColor,
    this.selectedHoverForegroundColor,
    this.shadows,
    this.decoration,
    this.cursor,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
    this.textStyle,
    this.gap,
    this.textDirection,
  }) : variant = ShadToggleVariant.outline,
       minWidth = null,
       mutuallyExclusive = false;

  /// {@macro ShadToggle}
  const ShadToggle.raw({
    super.key,
    required this.variant,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.child,
    this.leading,
    this.trailing,
    this.size,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.selectedBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.selectedForegroundColor,
    this.selectedHoverForegroundColor,
    this.shadows,
    this.decoration,
    this.cursor,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.onHoverChange,
    this.statesController,
    this.textStyle,
    this.gap,
    this.textDirection,
    this.minWidth,
    this.mutuallyExclusive = false,
  });

  /// {@template ShadToggle.variant}
  /// The variant of the toggle, defaults to [ShadToggleVariant.primary].
  /// {@endtemplate}
  final ShadToggleVariant variant;

  /// {@template ShadToggle.value}
  /// Whether the toggle is currently on (pressed) or off.
  /// {@endtemplate}
  final bool value;

  /// {@template ShadToggle.onChanged}
  /// Called with the new value when the toggle is pressed.
  ///
  /// If null, pressing the toggle does nothing.
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template ShadToggle.enabled}
  /// Whether the toggle is enabled, defaults to true.
  /// {@endtemplate}
  final bool enabled;

  /// {@template ShadToggle.child}
  /// The main content of the toggle, typically an icon or a text.
  /// {@endtemplate}
  final Widget? child;

  /// {@template ShadToggle.leading}
  /// The widget displayed before the [child].
  /// {@endtemplate}
  final Widget? leading;

  /// {@template ShadToggle.trailing}
  /// The widget displayed after the [child].
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template ShadToggle.size}
  /// The size of the toggle, defaults to [ShadButtonSize.regular].
  /// {@endtemplate}
  final ShadButtonSize? size;

  /// {@template ShadToggle.width}
  /// The fixed width of the toggle.
  ///
  /// When null, the toggle sizes itself to its content, and is never
  /// narrower than its height.
  /// {@endtemplate}
  final double? width;

  /// {@template ShadToggle.height}
  /// The height of the toggle, overrides the height given by [size].
  /// {@endtemplate}
  final double? height;

  /// {@template ShadToggle.padding}
  /// The padding of the toggle, overrides the padding given by [size].
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadToggle.backgroundColor}
  /// The background color of the toggle when it is off.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadToggle.hoverBackgroundColor}
  /// The background color of the toggle when it is off and hovered.
  /// {@endtemplate}
  final Color? hoverBackgroundColor;

  /// {@template ShadToggle.selectedBackgroundColor}
  /// The background color of the toggle when it is on.
  /// {@endtemplate}
  final Color? selectedBackgroundColor;

  /// {@template ShadToggle.selectedHoverBackgroundColor}
  /// The background color of the toggle when it is on and hovered.
  /// {@endtemplate}
  final Color? selectedHoverBackgroundColor;

  /// {@template ShadToggle.foregroundColor}
  /// The color of the text and icons of the toggle when it is off.
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template ShadToggle.hoverForegroundColor}
  /// The color of the text and icons of the toggle when it is off and hovered.
  /// {@endtemplate}
  final Color? hoverForegroundColor;

  /// {@template ShadToggle.selectedForegroundColor}
  /// The color of the text and icons of the toggle when it is on.
  /// {@endtemplate}
  final Color? selectedForegroundColor;

  /// {@template ShadToggle.selectedHoverForegroundColor}
  /// The color of the text and icons of the toggle when it is on and hovered.
  /// {@endtemplate}
  final Color? selectedHoverForegroundColor;

  /// {@template ShadToggle.shadows}
  /// The shadows of the toggle.
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template ShadToggle.decoration}
  /// The decoration of the toggle, merged with the theme decoration.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadToggle.cursor}
  /// The mouse cursor of the toggle, defaults to [SystemMouseCursors.click]
  /// when enabled.
  /// {@endtemplate}
  final MouseCursor? cursor;

  /// {@macro ShadButton.focusNode}
  final FocusNode? focusNode;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  /// {@template ShadToggle.textStyle}
  /// The text style of the toggle, defaults to `ShadTextTheme.small`.
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadToggle.gap}
  /// The gap between [leading], [child] and [trailing], defaults to 8.
  /// {@endtemplate}
  final double? gap;

  /// {@macro ShadButton.textDirection}
  final TextDirection? textDirection;

  /// {@template ShadToggle.minWidth}
  /// The minimum width of the toggle when [width] is null, defaults to its
  /// height so icon-only toggles are square.
  ///
  /// `ShadToggleGroup` sets it to 0, like shadcn/ui toggle group items.
  /// {@endtemplate}
  final double? minWidth;

  /// {@template ShadToggle.mutuallyExclusive}
  /// Whether the toggle is announced as a checked radio item instead of a
  /// toggle button, defaults to false.
  ///
  /// Set by `ShadToggleGroup` for the items of a single selection group.
  /// {@endtemplate}
  final bool mutuallyExclusive;

  ShadToggleTheme _toggleTheme(ShadThemeData theme) {
    return switch (variant) {
      ShadToggleVariant.primary => theme.primaryToggleTheme,
      ShadToggleVariant.outline => theme.outlineToggleTheme,
    };
  }

  ShadButtonSizeTheme _sizeTheme(
    ShadThemeData theme,
    ShadToggleTheme toggleTheme,
    ShadButtonSize size,
  ) {
    final sizesTheme = toggleTheme.sizesTheme;
    return switch (size) {
      ShadButtonSize.sm => sizesTheme?.sm ?? theme.toggleSizesTheme.sm!,
      ShadButtonSize.lg => sizesTheme?.lg ?? theme.toggleSizesTheme.lg!,
      ShadButtonSize.regular =>
        sizesTheme?.regular ?? theme.toggleSizesTheme.regular!,
    };
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasShadTheme(context));
    final theme = ShadTheme.of(context);
    final toggleTheme = _toggleTheme(theme);

    final sizeTheme = _sizeTheme(
      theme,
      toggleTheme,
      size ?? toggleTheme.size ?? ShadButtonSize.regular,
    );
    final effectiveHeight = height ?? toggleTheme.height ?? sizeTheme.height;
    final effectivePadding =
        padding ?? toggleTheme.padding ?? sizeTheme.padding;
    final effectiveWidth = width ?? sizeTheme.width;

    final effectiveBackgroundColor =
        backgroundColor ??
        toggleTheme.backgroundColor ??
        const Color(0x00000000);
    final effectiveHoverBackgroundColor =
        hoverBackgroundColor ??
        toggleTheme.hoverBackgroundColor ??
        effectiveBackgroundColor;
    final effectiveSelectedBackgroundColor =
        selectedBackgroundColor ??
        toggleTheme.selectedBackgroundColor ??
        theme.colorScheme.accent;
    final effectiveSelectedHoverBackgroundColor =
        selectedHoverBackgroundColor ??
        toggleTheme.selectedHoverBackgroundColor ??
        effectiveSelectedBackgroundColor;

    final effectiveForegroundColor =
        foregroundColor ??
        toggleTheme.foregroundColor ??
        theme.colorScheme.foreground;
    final effectiveHoverForegroundColor =
        hoverForegroundColor ??
        toggleTheme.hoverForegroundColor ??
        effectiveForegroundColor;
    final effectiveSelectedForegroundColor =
        selectedForegroundColor ??
        toggleTheme.selectedForegroundColor ??
        theme.colorScheme.accentForeground;
    final effectiveSelectedHoverForegroundColor =
        selectedHoverForegroundColor ??
        toggleTheme.selectedHoverForegroundColor ??
        effectiveSelectedForegroundColor;

    final effectiveDecoration =
        (toggleTheme.decoration ?? const ShadDecoration()).merge(decoration);

    Widget toggle = ShadButton.ghost(
      enabled: enabled,
      onPressed: onChanged == null ? null : () => onChanged!(!value),
      leading: leading,
      trailing: trailing,
      width: effectiveWidth,
      height: effectiveHeight,
      padding: effectivePadding,
      backgroundColor: value
          ? effectiveSelectedBackgroundColor
          : effectiveBackgroundColor,
      hoverBackgroundColor: value
          ? effectiveSelectedHoverBackgroundColor
          : effectiveHoverBackgroundColor,
      foregroundColor: value
          ? effectiveSelectedForegroundColor
          : effectiveForegroundColor,
      hoverForegroundColor: value
          ? effectiveSelectedHoverForegroundColor
          : effectiveHoverForegroundColor,
      shadows: shadows ?? toggleTheme.shadows,
      decoration: effectiveDecoration,
      cursor: cursor ?? toggleTheme.cursor,
      focusNode: focusNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      onHoverChange: onHoverChange,
      statesController: statesController,
      textStyle: textStyle ?? toggleTheme.textStyle,
      gap: gap ?? toggleTheme.gap,
      textDirection: textDirection,
      child: child,
    );

    if (effectiveWidth == null) {
      toggle = ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth ?? effectiveHeight),
        child: toggle,
      );
    }

    return MergeSemantics(
      child: Semantics(
        toggled: mutuallyExclusive ? null : value,
        checked: mutuallyExclusive ? value : null,
        inMutuallyExclusiveGroup: mutuallyExclusive ? true : null,
        child: toggle,
      ),
    );
  }
}
