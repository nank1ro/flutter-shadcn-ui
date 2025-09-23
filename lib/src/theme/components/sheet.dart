import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/components/sheet.dart';
import 'package:shadcn_ui/src/utils/position.dart';

@immutable
class ShadSheetTheme {
  const ShadSheetTheme({
    this.merge = true,
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
  });

  final bool merge;

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

  static ShadSheetTheme lerp(
    ShadSheetTheme a,
    ShadSheetTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSheetTheme(
      merge: b.merge,
      closeIconData: b.closeIconData,
      closeIconPosition:
          ShadPosition.lerp(a.closeIconPosition, b.closeIconPosition, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      expandActionsWhenTiny: b.expandActionsWhenTiny,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      gap: lerpDouble(a.gap, b.gap, t),
      actionsAxis: b.actionsAxis,
      actionsMainAxisSize: b.actionsMainAxisSize,
      actionsMainAxisAlignment: b.actionsMainAxisAlignment,
      actionsVerticalDirection: b.actionsVerticalDirection,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle:
          TextStyle.lerp(a.descriptionStyle, b.descriptionStyle, t),
      titleTextAlign: b.titleTextAlign,
      descriptionTextAlign: b.descriptionTextAlign,
      animateIn: b.animateIn,
      animateOut: b.animateOut,
      constraints: b.constraints,
      border: b.border,
      shadows: b.shadows,
      removeBorderRadiusWhenTiny: b.removeBorderRadiusWhenTiny,
      closeIcon: b.closeIcon,
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      scrollable: t < 0.5 ? a.scrollable : b.scrollable,
      scrollPadding:
          EdgeInsetsGeometry.lerp(a.scrollPadding, b.scrollPadding, t),
      disabledScrollControlMaxRatio: t < 0.5
          ? a.disabledScrollControlMaxRatio
          : b.disabledScrollControlMaxRatio,
      minFlingVelocity: t < 0.5 ? a.minFlingVelocity : b.minFlingVelocity,
      closeProgressThreshold:
          t < 0.5 ? a.closeProgressThreshold : b.closeProgressThreshold,
      side: t < 0.5 ? a.side : b.side,
      useSafeArea: t < 0.5 ? a.useSafeArea : b.useSafeArea,
    );
  }

  ShadSheetTheme copyWith({
    bool? merge,
    BoxConstraints? constraints,
    bool? expandCrossSide,
    Widget? closeIcon,
    IconData? closeIconData,
    ShadPosition? closeIconPosition,
    BorderRadius? radius,
    Color? backgroundColor,
    bool? expandActionsWhenTiny,
    EdgeInsetsGeometry? padding,
    double? gap,
    Axis? actionsAxis,
    MainAxisSize? actionsMainAxisSize,
    MainAxisAlignment? actionsMainAxisAlignment,
    VerticalDirection? actionsVerticalDirection,
    BoxBorder? border,
    List<BoxShadow>? shadows,
    bool? removeBorderRadiusWhenTiny,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextAlign? titleTextAlign,
    TextAlign? descriptionTextAlign,
    List<Effect<dynamic>>? animateIn,
    List<Effect<dynamic>>? animateOut,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    bool? scrollable,
    EdgeInsetsGeometry? scrollPadding,
    double? disabledScrollControlMaxRatio,
    double? minFlingVelocity,
    double? closeProgressThreshold,
    ShadSheetSide? side,
    bool? useSafeArea,
  }) {
    return ShadSheetTheme(
      merge: merge ?? this.merge,
      constraints: constraints ?? this.constraints,
      expandCrossSide: expandCrossSide ?? this.expandCrossSide,
      closeIcon: closeIcon ?? this.closeIcon,
      closeIconData: closeIconData ?? this.closeIconData,
      closeIconPosition: closeIconPosition ?? this.closeIconPosition,
      radius: radius ?? this.radius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expandActionsWhenTiny:
          expandActionsWhenTiny ?? this.expandActionsWhenTiny,
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      actionsAxis: actionsAxis ?? this.actionsAxis,
      actionsMainAxisSize: actionsMainAxisSize ?? this.actionsMainAxisSize,
      actionsMainAxisAlignment:
          actionsMainAxisAlignment ?? this.actionsMainAxisAlignment,
      actionsVerticalDirection:
          actionsVerticalDirection ?? this.actionsVerticalDirection,
      border: border ?? this.border,
      shadows: shadows ?? this.shadows,
      removeBorderRadiusWhenTiny:
          removeBorderRadiusWhenTiny ?? this.removeBorderRadiusWhenTiny,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      titleTextAlign: titleTextAlign ?? this.titleTextAlign,
      descriptionTextAlign: descriptionTextAlign ?? this.descriptionTextAlign,
      animateIn: animateIn ?? this.animateIn,
      animateOut: animateOut ?? this.animateOut,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      scrollable: scrollable ?? this.scrollable,
      scrollPadding: scrollPadding ?? this.scrollPadding,
      disabledScrollControlMaxRatio:
          disabledScrollControlMaxRatio ?? this.disabledScrollControlMaxRatio,
      minFlingVelocity: minFlingVelocity ?? this.minFlingVelocity,
      closeProgressThreshold:
          closeProgressThreshold ?? this.closeProgressThreshold,
      side: side ?? this.side,
      useSafeArea: useSafeArea ?? this.useSafeArea,
    );
  }

  ShadSheetTheme mergeWith(ShadSheetTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      closeIconData: other.closeIconData,
      closeIconPosition: other.closeIconPosition,
      radius: other.radius,
      backgroundColor: other.backgroundColor,
      expandActionsWhenTiny: other.expandActionsWhenTiny,
      padding: other.padding,
      gap: other.gap,
      actionsAxis: other.actionsAxis,
      actionsMainAxisSize: other.actionsMainAxisSize,
      actionsMainAxisAlignment: other.actionsMainAxisAlignment,
      actionsVerticalDirection: other.actionsVerticalDirection,
      border: other.border,
      shadows: other.shadows,
      removeBorderRadiusWhenTiny: other.removeBorderRadiusWhenTiny,
      titleStyle: other.titleStyle,
      descriptionStyle: other.descriptionStyle,
      titleTextAlign: other.titleTextAlign,
      descriptionTextAlign: other.descriptionTextAlign,
      animateIn: other.animateIn,
      animateOut: other.animateOut,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      scrollable: other.scrollable,
      scrollPadding: other.scrollPadding,
      disabledScrollControlMaxRatio: other.disabledScrollControlMaxRatio,
      minFlingVelocity: other.minFlingVelocity,
      closeProgressThreshold: other.closeProgressThreshold,
      side: other.side,
      useSafeArea: other.useSafeArea,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSheetTheme &&
        other.merge == merge &&
        other.constraints == constraints &&
        other.expandCrossSide == expandCrossSide &&
        other.closeIcon == closeIcon &&
        other.closeIconData == closeIconData &&
        other.closeIconPosition == closeIconPosition &&
        other.radius == radius &&
        other.backgroundColor == backgroundColor &&
        other.expandActionsWhenTiny == expandActionsWhenTiny &&
        other.padding == padding &&
        other.gap == gap &&
        other.actionsAxis == actionsAxis &&
        other.actionsMainAxisSize == actionsMainAxisSize &&
        other.actionsMainAxisAlignment == actionsMainAxisAlignment &&
        other.actionsVerticalDirection == actionsVerticalDirection &&
        other.border == border &&
        listEquals(other.shadows, shadows) &&
        other.removeBorderRadiusWhenTiny == removeBorderRadiusWhenTiny &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.titleTextAlign == titleTextAlign &&
        other.descriptionTextAlign == descriptionTextAlign &&
        listEquals(other.animateIn, animateIn) &&
        listEquals(other.animateOut, animateOut) &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.scrollable == scrollable &&
        other.scrollPadding == scrollPadding &&
        other.disabledScrollControlMaxRatio == disabledScrollControlMaxRatio &&
        other.minFlingVelocity == minFlingVelocity &&
        other.closeProgressThreshold == closeProgressThreshold &&
        other.side == side &&
        other.useSafeArea == useSafeArea;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        constraints.hashCode ^
        expandCrossSide.hashCode ^
        closeIcon.hashCode ^
        closeIconData.hashCode ^
        closeIconPosition.hashCode ^
        radius.hashCode ^
        backgroundColor.hashCode ^
        expandActionsWhenTiny.hashCode ^
        padding.hashCode ^
        gap.hashCode ^
        actionsAxis.hashCode ^
        actionsMainAxisSize.hashCode ^
        actionsMainAxisAlignment.hashCode ^
        actionsVerticalDirection.hashCode ^
        border.hashCode ^
        shadows.hashCode ^
        removeBorderRadiusWhenTiny.hashCode ^
        titleStyle.hashCode ^
        descriptionStyle.hashCode ^
        titleTextAlign.hashCode ^
        descriptionTextAlign.hashCode ^
        animateIn.hashCode ^
        animateOut.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        scrollable.hashCode ^
        scrollPadding.hashCode ^
        disabledScrollControlMaxRatio.hashCode ^
        minFlingVelocity.hashCode ^
        closeProgressThreshold.hashCode ^
        side.hashCode ^
        useSafeArea.hashCode;
  }
}
