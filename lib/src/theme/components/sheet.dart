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
    this.snapFlingVelocity,
    this.closeProgressThreshold,
    this.side,
    this.useSafeArea,
    this.titlePinned,
    this.descriptionPinned,
    this.actionsPinned,
    this.expandable,
    this.initialSize,
    this.minSize,
    this.maxSize,
    this.snap,
    this.snapSizes,
    this.snapAnimationDuration,
    this.snapAnimationCurve,
    this.showDragHandle,
    this.dragHandleColor,
    this.dragHandleWidth,
    this.dragHandleHeight,
    this.dragHandleRadius,
    this.dragHandleExtent,
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

  /// {@macro ShadSheet.snapFlingVelocity}
  final double? snapFlingVelocity;

  /// {@macro ShadSheet.closeProgressThreshold}
  final double? closeProgressThreshold;

  /// {@macro ShadSheet.side}
  final ShadSheetSide? side;

  /// {@macro ShadDialog.useSafeArea}
  final bool? useSafeArea;

  /// {@macro ShadDialog.titlePinned}
  final bool? titlePinned;

  /// {@macro ShadDialog.descriptionPinned}
  final bool? descriptionPinned;

  /// {@macro ShadDialog.actionsPinned}
  final bool? actionsPinned;

  /// {@macro ShadSheet.expandable}
  final bool? expandable;

  /// {@macro ShadSheet.initialSize}
  final double? initialSize;

  /// {@macro ShadSheet.minSize}
  final double? minSize;

  /// {@macro ShadSheet.maxSize}
  final double? maxSize;

  /// {@macro ShadSheet.snap}
  final bool? snap;

  /// {@macro ShadSheet.snapSizes}
  final List<double>? snapSizes;

  /// {@macro ShadSheet.snapAnimationDuration}
  final Duration? snapAnimationDuration;

  /// {@macro ShadSheet.snapAnimationCurve}
  final Curve? snapAnimationCurve;

  /// {@macro ShadSheet.showDragHandle}
  final bool? showDragHandle;

  /// Color of the default drag handle pill.
  final Color? dragHandleColor;

  /// Width of the default drag handle pill. Defaults to 36.0.
  final double? dragHandleWidth;

  /// Height of the default drag handle pill. Defaults to 4.0.
  final double? dragHandleHeight;

  /// Border radius of the default drag handle pill.
  final BorderRadius? dragHandleRadius;

  /// {@macro ShadSheet.dragHandleExtent}
  final double? dragHandleExtent;

  static ShadSheetTheme? lerp(
    ShadSheetTheme? a,
    ShadSheetTheme? b,
    double t,
  ) => _$ShadSheetTheme.lerp(a, b, t);
}
