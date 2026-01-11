import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/border.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'pagination.g.theme.dart';

@themeGen
@immutable
class ShadPaginationTheme with _$ShadPaginationTheme {
  const ShadPaginationTheme({
    bool canMerge = true,
    this.radius,
    this.padding,
    this.backgroundColor,
    this.border,
    this.buttonVariant,
    this.buttonSize,
    this.buttonCursor,
    this.buttonWidth,
    this.buttonHeight = 40.0,
    this.buttonPadding,
    this.buttonBackgroundColor,
    this.buttonSelectedBackgroundColor,
    this.buttonSelectedForegroundColor,
    this.buttonHoverBackgroundColor,
    this.buttonForegroundColor,
    this.buttonHoverForegroundColor,
    this.buttonPressedBackgroundColor,
    this.buttonPressedForegroundColor,
    this.buttonShadows,
    this.buttonGradient,
    this.buttonTextDecoration,
    this.buttonHoverTextDecoration,
    this.buttonDecoration,
    this.buttonGap = 4.0,
    this.buttonMainAxisAlignment,
    this.buttonCrossAxisAlignment,
    this.buttonHoverStrategies,
    this.buttonLongPressDuration,
    this.buttonTextDirection,
    this.buttonExpands,
    this.ellipsisColor,
    this.navigationButtonVariant,
    this.navigationButtonSize,
    this.compactButtonVariant = ShadButtonVariant.ghost,
    this.showPreviousNextLabels = false,
    this.compactBreakpoint = 768.0,
    this.siblingCount = 1,
    this.boundaryCount = 1,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadPagination.radius}
  final BorderRadiusGeometry? radius;

  /// {@macro ShadPagination.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadPagination.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadPagination.border}
  final ShadBorder? border;

  /// {@macro ShadButton.variant}
  final ShadButtonVariant? buttonVariant;

  /// {@macro ShadButton.size}
  final ShadButtonSize? buttonSize;

  /// {@macro ShadButton.cursor}
  final MouseCursor? buttonCursor;

  /// {@macro ShadButton.width}
  final double? buttonWidth;

  /// {@macro ShadPagination.buttonHeight}
  final double? buttonHeight;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.backgroundColor}
  final Color? buttonBackgroundColor;

  /// {@macro ShadPagination.selectedButtonBackgroundColor}
  final Color? buttonSelectedBackgroundColor;

  /// {@macro ShadPagination.selectedButtonForegroundColor}
  final Color? buttonSelectedForegroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? buttonHoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? buttonForegroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? buttonHoverForegroundColor;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? buttonPressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? buttonPressedForegroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? buttonGradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? buttonTextDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? buttonHoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final ShadDecoration? buttonDecoration;

  /// {@macro ShadButton.gap}
  final double? buttonGap;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? buttonMainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? buttonCrossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final ShadHoverStrategies? buttonHoverStrategies;

  /// {@macro ShadButton.longPressDuration}
  final Duration? buttonLongPressDuration;

  /// {@macro ShadButton.textDirection}
  final TextDirection? buttonTextDirection;

  /// {@macro ShadButton.expands}
  final bool? buttonExpands;

  /// {@macro ShadPagination.ellipsisColor}
  final Color? ellipsisColor;

  /// {@macro ShadPagination.navigationButtonVariant}
  final ShadButtonVariant? navigationButtonVariant;

  /// {@macro ShadPagination.navigationButtonSize}
  final ShadButtonSize? navigationButtonSize;

  /// {@macro ShadPagination.compactButtonVariant}
  final ShadButtonVariant? compactButtonVariant;

  /// {@macro ShadPagination.showPreviousNextLabels}
  final bool showPreviousNextLabels;

  /// {@macro ShadPagination.compactBreakpoint}
  final double compactBreakpoint;

  /// {@macro ShadPagination.siblingCount}
  final int siblingCount;

  /// {@macro ShadPagination.boundaryCount}
  final int boundaryCount;

  /// {@macro ShadPagination.margin}
  final EdgeInsetsGeometry? margin;

  static ShadPaginationTheme? lerp(
    ShadPaginationTheme? a,
    ShadPaginationTheme? b,
    double t,
  ) => _$ShadPaginationTheme.lerp(a, b, t);
}
