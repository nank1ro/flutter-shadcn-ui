import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/utils/position.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'dialog.g.theme.dart';

@themeGen
@immutable
class ShadDialogTheme with _$ShadDialogTheme {
  const ShadDialogTheme({
    bool canMerge = true,
    this.closeIconData,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.animateIn,
    this.animateOut,
    this.constraints,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
    this.actionsGap,
    this.useSafeArea,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadDialog.closeIconData}
  final IconData? closeIconData;

  /// {@macro ShadDialog.closeIconPosition}
  final ShadPosition? closeIconPosition;

  /// {@macro ShadDialog.radius}
  final BorderRadius? radius;

  /// {@macro ShadDialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadDialog.expandActionsWhenTiny}
  final bool? expandActionsWhenTiny;

  /// {@macro ShadDialog.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadDialog.gap}
  final double? gap;

  /// {@macro ShadDialog.animateIn}
  final List<Effect<dynamic>>? animateIn;

  /// {@macro ShadDialog.animateOut}
  final List<Effect<dynamic>>? animateOut;

  /// {@macro ShadDialog.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadDialog.actionsAxis}
  final Axis? actionsAxis;

  /// {@macro ShadDialog.actionsMainAxisSize}
  final MainAxisSize? actionsMainAxisSize;

  /// {@macro ShadDialog.actionsMainAxisAlignment}
  final MainAxisAlignment? actionsMainAxisAlignment;

  /// {@macro ShadDialog.actionsVerticalDirection}
  final VerticalDirection? actionsVerticalDirection;

  /// {@macro ShadDialog.border}
  final BoxBorder? border;

  /// {@macro ShadDialog.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadDialog.removeBorderRadiusWhenTiny}
  final bool? removeBorderRadiusWhenTiny;

  /// {@macro ShadDialog.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ShadDialog.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ShadDialog.titleTextAlign}
  final TextAlign? titleTextAlign;

  /// {@macro ShadDialog.descriptionTextAlign}
  final TextAlign? descriptionTextAlign;

  /// {@macro ShadDialog.alignment}
  final Alignment? alignment;

  /// {@macro ShadDialog.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadDialog.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadDialog.scrollable}
  final bool? scrollable;

  /// {@macro ShadDialog.scrollPadding}
  final EdgeInsetsGeometry? scrollPadding;

  /// {@macro ShadDialog.actionsGap}
  final double? actionsGap;

  /// {@macro ShadDialog.useSafeArea}
  final bool? useSafeArea;

  static ShadDialogTheme? lerp(
    ShadDialogTheme? a,
    ShadDialogTheme? b,
    double t,
  ) =>
      _$ShadDialogTheme.lerp(a, b, t);
}
