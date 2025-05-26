import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/utils/position.dart';

@immutable
class ShadDialogTheme {
  const ShadDialogTheme({
    this.merge = true,
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
  });

  final bool merge;

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
  final EdgeInsets? padding;

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
  final EdgeInsets? scrollPadding;

  /// {@macro ShadDialog.actionsGap}
  final double? actionsGap;

  static ShadDialogTheme lerp(
    ShadDialogTheme a,
    ShadDialogTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDialogTheme(
      merge: b.merge,
      closeIconData: b.closeIconData,
      closeIconPosition:
          ShadPosition.lerp(a.closeIconPosition, b.closeIconPosition, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      expandActionsWhenTiny: b.expandActionsWhenTiny,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      gap: lerpDouble(a.gap, b.gap, t),
      animateIn: b.animateIn,
      animateOut: b.animateOut,
      constraints: b.constraints,
      border: b.border,
      shadows: b.shadows,
      removeBorderRadiusWhenTiny: b.removeBorderRadiusWhenTiny,
      actionsAxis: b.actionsAxis,
      actionsMainAxisSize: b.actionsMainAxisSize,
      actionsMainAxisAlignment: b.actionsMainAxisAlignment,
      actionsVerticalDirection: b.actionsVerticalDirection,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle:
          TextStyle.lerp(a.descriptionStyle, b.descriptionStyle, t),
      titleTextAlign: b.titleTextAlign,
      descriptionTextAlign: b.descriptionTextAlign,
      alignment: Alignment.lerp(a.alignment, b.alignment, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      scrollable: t < 0.5 ? a.scrollable : b.scrollable,
      scrollPadding: EdgeInsets.lerp(a.scrollPadding, b.scrollPadding, t),
      actionsGap: lerpDouble(a.actionsGap, b.actionsGap, t),
    );
  }

  ShadDialogTheme copyWith({
    bool? merge,
    IconData? closeIconData,
    ShadPosition? closeIconPosition,
    BorderRadius? radius,
    Color? backgroundColor,
    bool? expandActionsWhenTiny,
    EdgeInsets? padding,
    double? gap,
    List<Effect<dynamic>>? animateIn,
    List<Effect<dynamic>>? animateOut,
    BoxConstraints? constraints,
    BoxBorder? border,
    List<BoxShadow>? shadows,
    bool? removeBorderRadiusWhenTiny,
    Axis? actionsAxis,
    MainAxisSize? actionsMainAxisSize,
    MainAxisAlignment? actionsMainAxisAlignment,
    VerticalDirection? actionsVerticalDirection,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextAlign? titleTextAlign,
    TextAlign? descriptionTextAlign,
    Alignment? alignment,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    bool? scrollable,
    EdgeInsets? scrollPadding,
    double? actionsGap,
  }) {
    return ShadDialogTheme(
      merge: merge ?? this.merge,
      closeIconData: closeIconData,
      closeIconPosition: closeIconPosition,
      radius: radius,
      backgroundColor: backgroundColor,
      expandActionsWhenTiny: expandActionsWhenTiny,
      padding: padding,
      gap: gap,
      animateIn: animateIn,
      animateOut: animateOut,
      constraints: constraints,
      border: border,
      shadows: shadows,
      removeBorderRadiusWhenTiny: removeBorderRadiusWhenTiny,
      actionsAxis: actionsAxis,
      actionsMainAxisSize: actionsMainAxisSize,
      actionsMainAxisAlignment: actionsMainAxisAlignment,
      actionsVerticalDirection: actionsVerticalDirection,
      titleStyle: titleStyle,
      descriptionStyle: descriptionStyle,
      titleTextAlign: titleTextAlign,
      descriptionTextAlign: descriptionTextAlign,
      alignment: alignment,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      scrollable: scrollable,
      scrollPadding: scrollPadding,
      actionsGap: actionsGap,
    );
  }

  ShadDialogTheme mergeWith(ShadDialogTheme? other) {
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
      animateIn: other.animateIn,
      animateOut: other.animateOut,
      constraints: other.constraints,
      border: other.border,
      shadows: other.shadows,
      removeBorderRadiusWhenTiny: other.removeBorderRadiusWhenTiny,
      actionsAxis: other.actionsAxis,
      actionsMainAxisSize: other.actionsMainAxisSize,
      actionsMainAxisAlignment: other.actionsMainAxisAlignment,
      actionsVerticalDirection: other.actionsVerticalDirection,
      titleStyle: other.titleStyle,
      descriptionStyle: other.descriptionStyle,
      titleTextAlign: other.titleTextAlign,
      descriptionTextAlign: other.descriptionTextAlign,
      alignment: other.alignment,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      scrollable: other.scrollable,
      scrollPadding: other.scrollPadding,
      actionsGap: other.actionsGap,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDialogTheme &&
        other.merge == merge &&
        other.closeIconData == closeIconData &&
        other.closeIconPosition == closeIconPosition &&
        other.radius == radius &&
        other.backgroundColor == backgroundColor &&
        other.expandActionsWhenTiny == expandActionsWhenTiny &&
        other.padding == padding &&
        other.gap == gap &&
        listEquals(other.animateIn, animateIn) &&
        listEquals(other.animateOut, animateOut) &&
        other.constraints == constraints &&
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
        other.alignment == alignment &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.scrollable == scrollable &&
        other.scrollPadding == scrollPadding &&
        other.actionsGap == actionsGap;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        closeIconData.hashCode ^
        closeIconPosition.hashCode ^
        radius.hashCode ^
        backgroundColor.hashCode ^
        expandActionsWhenTiny.hashCode ^
        padding.hashCode ^
        gap.hashCode ^
        animateIn.hashCode ^
        animateOut.hashCode ^
        constraints.hashCode ^
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
        alignment.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        scrollable.hashCode ^
        scrollPadding.hashCode ^
        actionsGap.hashCode;
  }
}
