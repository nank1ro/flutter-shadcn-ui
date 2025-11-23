// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sheet.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSheetTheme {
  bool get canMerge => true;

  static ShadSheetTheme? lerp(ShadSheetTheme? a, ShadSheetTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSheetTheme(
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      expandCrossSide: t < 0.5 ? a?.expandCrossSide : b?.expandCrossSide,
      closeIcon: t < 0.5 ? a?.closeIcon : b?.closeIcon,
      closeIconData: t < 0.5 ? a?.closeIconData : b?.closeIconData,
      closeIconPosition: ShadPosition.lerp(
        a?.closeIconPosition,
        b?.closeIconPosition,
        t,
      ),
      radius: BorderRadius.lerp(a?.radius, b?.radius, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      expandActionsWhenTiny: t < 0.5
          ? a?.expandActionsWhenTiny
          : b?.expandActionsWhenTiny,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      gap: lerpDouble$(a?.gap, b?.gap, t),
      actionsAxis: t < 0.5 ? a?.actionsAxis : b?.actionsAxis,
      actionsMainAxisSize: t < 0.5
          ? a?.actionsMainAxisSize
          : b?.actionsMainAxisSize,
      actionsMainAxisAlignment: t < 0.5
          ? a?.actionsMainAxisAlignment
          : b?.actionsMainAxisAlignment,
      actionsVerticalDirection: t < 0.5
          ? a?.actionsVerticalDirection
          : b?.actionsVerticalDirection,
      border: BoxBorder.lerp(a?.border, b?.border, t),
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      removeBorderRadiusWhenTiny: t < 0.5
          ? a?.removeBorderRadiusWhenTiny
          : b?.removeBorderRadiusWhenTiny,
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a?.descriptionStyle,
        b?.descriptionStyle,
        t,
      ),
      titleTextAlign: t < 0.5 ? a?.titleTextAlign : b?.titleTextAlign,
      descriptionTextAlign: t < 0.5
          ? a?.descriptionTextAlign
          : b?.descriptionTextAlign,
      animateIn: t < 0.5 ? a?.animateIn : b?.animateIn,
      animateOut: t < 0.5 ? a?.animateOut : b?.animateOut,
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      scrollable: t < 0.5 ? a?.scrollable : b?.scrollable,
      scrollPadding: EdgeInsetsGeometry.lerp(
        a?.scrollPadding,
        b?.scrollPadding,
        t,
      ),
      disabledScrollControlMaxRatio: lerpDouble$(
        a?.disabledScrollControlMaxRatio,
        b?.disabledScrollControlMaxRatio,
        t,
      ),
      minFlingVelocity: lerpDouble$(
        a?.minFlingVelocity,
        b?.minFlingVelocity,
        t,
      ),
      closeProgressThreshold: lerpDouble$(
        a?.closeProgressThreshold,
        b?.closeProgressThreshold,
        t,
      ),
      side: t < 0.5 ? a?.side : b?.side,
      useSafeArea: t < 0.5 ? a?.useSafeArea : b?.useSafeArea,
      titlePinned: t < 0.5 ? a?.titlePinned : b?.titlePinned,
      descriptionPinned: t < 0.5 ? a?.descriptionPinned : b?.descriptionPinned,
      actionsPinned: t < 0.5 ? a?.actionsPinned : b?.actionsPinned,
    );
  }

  ShadSheetTheme copyWith({
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
    bool? titlePinned,
    bool? descriptionPinned,
    bool? actionsPinned,
  }) {
    final a = (this as ShadSheetTheme);

    return ShadSheetTheme(
      constraints: constraints ?? a.constraints,
      expandCrossSide: expandCrossSide ?? a.expandCrossSide,
      closeIcon: closeIcon ?? a.closeIcon,
      closeIconData: closeIconData ?? a.closeIconData,
      closeIconPosition: closeIconPosition ?? a.closeIconPosition,
      radius: radius ?? a.radius,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      expandActionsWhenTiny: expandActionsWhenTiny ?? a.expandActionsWhenTiny,
      padding: padding ?? a.padding,
      gap: gap ?? a.gap,
      actionsAxis: actionsAxis ?? a.actionsAxis,
      actionsMainAxisSize: actionsMainAxisSize ?? a.actionsMainAxisSize,
      actionsMainAxisAlignment:
          actionsMainAxisAlignment ?? a.actionsMainAxisAlignment,
      actionsVerticalDirection:
          actionsVerticalDirection ?? a.actionsVerticalDirection,
      border: border ?? a.border,
      shadows: shadows ?? a.shadows,
      removeBorderRadiusWhenTiny:
          removeBorderRadiusWhenTiny ?? a.removeBorderRadiusWhenTiny,
      titleStyle: titleStyle ?? a.titleStyle,
      descriptionStyle: descriptionStyle ?? a.descriptionStyle,
      titleTextAlign: titleTextAlign ?? a.titleTextAlign,
      descriptionTextAlign: descriptionTextAlign ?? a.descriptionTextAlign,
      animateIn: animateIn ?? a.animateIn,
      animateOut: animateOut ?? a.animateOut,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      scrollable: scrollable ?? a.scrollable,
      scrollPadding: scrollPadding ?? a.scrollPadding,
      disabledScrollControlMaxRatio:
          disabledScrollControlMaxRatio ?? a.disabledScrollControlMaxRatio,
      minFlingVelocity: minFlingVelocity ?? a.minFlingVelocity,
      closeProgressThreshold:
          closeProgressThreshold ?? a.closeProgressThreshold,
      side: side ?? a.side,
      useSafeArea: useSafeArea ?? a.useSafeArea,
      titlePinned: titlePinned ?? a.titlePinned,
      descriptionPinned: descriptionPinned ?? a.descriptionPinned,
      actionsPinned: actionsPinned ?? a.actionsPinned,
    );
  }

  ShadSheetTheme merge(ShadSheetTheme? other) {
    final current = (this as ShadSheetTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      constraints: other.constraints,
      expandCrossSide: other.expandCrossSide,
      closeIcon: other.closeIcon,
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
      titleStyle:
          current.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          current.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
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
      titlePinned: other.titlePinned,
      descriptionPinned: other.descriptionPinned,
      actionsPinned: other.actionsPinned,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadSheetTheme) {
      return false;
    }

    final value = (this as ShadSheetTheme);

    return other.constraints == value.constraints &&
        other.expandCrossSide == value.expandCrossSide &&
        other.closeIcon == value.closeIcon &&
        other.closeIconData == value.closeIconData &&
        other.closeIconPosition == value.closeIconPosition &&
        other.radius == value.radius &&
        other.backgroundColor == value.backgroundColor &&
        other.expandActionsWhenTiny == value.expandActionsWhenTiny &&
        other.padding == value.padding &&
        other.gap == value.gap &&
        other.actionsAxis == value.actionsAxis &&
        other.actionsMainAxisSize == value.actionsMainAxisSize &&
        other.actionsMainAxisAlignment == value.actionsMainAxisAlignment &&
        other.actionsVerticalDirection == value.actionsVerticalDirection &&
        other.border == value.border &&
        other.shadows == value.shadows &&
        other.removeBorderRadiusWhenTiny == value.removeBorderRadiusWhenTiny &&
        other.titleStyle == value.titleStyle &&
        other.descriptionStyle == value.descriptionStyle &&
        other.titleTextAlign == value.titleTextAlign &&
        other.descriptionTextAlign == value.descriptionTextAlign &&
        other.animateIn == value.animateIn &&
        other.animateOut == value.animateOut &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.scrollable == value.scrollable &&
        other.scrollPadding == value.scrollPadding &&
        other.disabledScrollControlMaxRatio ==
            value.disabledScrollControlMaxRatio &&
        other.minFlingVelocity == value.minFlingVelocity &&
        other.closeProgressThreshold == value.closeProgressThreshold &&
        other.side == value.side &&
        other.useSafeArea == value.useSafeArea &&
        other.titlePinned == value.titlePinned &&
        other.descriptionPinned == value.descriptionPinned &&
        other.actionsPinned == value.actionsPinned;
  }

  @override
  int get hashCode {
    final value = (this as ShadSheetTheme);

    return Object.hashAll([
      runtimeType,
      value.constraints,
      value.expandCrossSide,
      value.closeIcon,
      value.closeIconData,
      value.closeIconPosition,
      value.radius,
      value.backgroundColor,
      value.expandActionsWhenTiny,
      value.padding,
      value.gap,
      value.actionsAxis,
      value.actionsMainAxisSize,
      value.actionsMainAxisAlignment,
      value.actionsVerticalDirection,
      value.border,
      value.shadows,
      value.removeBorderRadiusWhenTiny,
      value.titleStyle,
      value.descriptionStyle,
      value.titleTextAlign,
      value.descriptionTextAlign,
      value.animateIn,
      value.animateOut,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.scrollable,
      value.scrollPadding,
      value.disabledScrollControlMaxRatio,
      value.minFlingVelocity,
      value.closeProgressThreshold,
      value.side,
      value.useSafeArea,
      value.titlePinned,
      value.descriptionPinned,
      value.actionsPinned,
    ]);
  }
}
