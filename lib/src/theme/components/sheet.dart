import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/sheet.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sheet.g.theme.dart';

@themeGen
@immutable
class ShadSheetTheme with _$ShadSheetTheme {
  const ShadSheetTheme({
    bool canMerge = true,
    this.constraints,
    this.expandCrossSide,
    this.closeIcon,
    this.closeIconData,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.animateIn,
    this.animateOut,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
    this.disabledScrollControlMaxRatio,
    this.minFlingVelocity,
    this.closeProgressThreshold,
    this.side,
    this.useSafeArea,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSheet.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadSheet.expandCrossSide}
  final bool? expandCrossSide;

  /// {@macro ShadSheet.closeIcon}
  final Widget? closeIcon;

  /// {@macro ShadSheet.closeIconData}
  final IconData? closeIconData;

  /// {@macro ShadSheet.closeIconPosition}
  final ShadPosition? closeIconPosition;

  /// {@macro ShadSheet.radius}
  final BorderRadius? radius;

  /// {@macro ShadSheet.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadSheet.expandActionsWhenTiny}
  final bool? expandActionsWhenTiny;

  /// {@macro ShadSheet.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadSheet.gap}
  final double? gap;

  /// {@macro ShadSheet.actionsAxis}
  final Axis? actionsAxis;

  /// {@macro ShadSheet.actionsMainAxisSize}
  final MainAxisSize? actionsMainAxisSize;

  /// {@macro ShadSheet.actionsMainAxisAlignment}
  final MainAxisAlignment? actionsMainAxisAlignment;

  /// {@macro ShadSheet.actionsVerticalDirection}
  final VerticalDirection? actionsVerticalDirection;

  /// {@macro ShadSheet.border}
  final BoxBorder? border;

  /// {@macro ShadSheet.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadSheet.removeBorderRadiusWhenTiny}
  final bool? removeBorderRadiusWhenTiny;

  /// {@macro ShadSheet.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ShadSheet.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ShadSheet.titleTextAlign}
  final TextAlign? titleTextAlign;

  /// {@macro ShadSheet.descriptionTextAlign}
  final TextAlign? descriptionTextAlign;

  /// {@macro ShadSheet.animateIn}
  final List<Effect<dynamic>>? animateIn;

  /// {@macro ShadSheet.animateOut}
  final List<Effect<dynamic>>? animateOut;

  /// {@macro ShadSheet.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadSheet.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadSheet.scrollable}
  final bool? scrollable;

  /// {@macro ShadSheet.scrollPadding}
  final EdgeInsetsGeometry? scrollPadding;

  /// {@macro ShadSheet.disabledScrollControlMaxRatio}
  final double? disabledScrollControlMaxRatio;

  /// {@macro ShadSheet.minFlingVelocity}
  final double? minFlingVelocity;

  /// {@macro ShadSheet.closeProgressThreshold}
  final double? closeProgressThreshold;

  /// {@macro ShadSheet.side}
  final ShadSheetSide? side;

  /// {@macro ShadDialog.useSafeArea}
  final bool? useSafeArea;

  static ShadSheetTheme? lerp(
    ShadSheetTheme? a,
    ShadSheetTheme? b,
    double t,
  ) => _$ShadSheetTheme.lerp(a, b, t);
}
