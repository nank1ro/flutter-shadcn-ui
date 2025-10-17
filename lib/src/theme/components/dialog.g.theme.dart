// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'dialog.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadDialogTheme {
  bool get canMerge => true;

  static ShadDialogTheme? lerp(
    ShadDialogTheme? a,
    ShadDialogTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadDialogTheme(
      closeIconData: t < 0.5 ? a?.closeIconData : b?.closeIconData,
      closeIconPosition: ShadPosition.lerp(
        a?.closeIconPosition,
        b?.closeIconPosition,
        t,
      ),
      radius: BorderRadius.lerp(a?.radius, b?.radius, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      expandActionsWhenTiny:
          t < 0.5 ? a?.expandActionsWhenTiny : b?.expandActionsWhenTiny,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      gap: lerpDouble$(a?.gap, b?.gap, t),
      animateIn: t < 0.5 ? a?.animateIn : b?.animateIn,
      animateOut: t < 0.5 ? a?.animateOut : b?.animateOut,
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      actionsAxis: t < 0.5 ? a?.actionsAxis : b?.actionsAxis,
      actionsMainAxisSize:
          t < 0.5 ? a?.actionsMainAxisSize : b?.actionsMainAxisSize,
      actionsMainAxisAlignment:
          t < 0.5 ? a?.actionsMainAxisAlignment : b?.actionsMainAxisAlignment,
      actionsVerticalDirection:
          t < 0.5 ? a?.actionsVerticalDirection : b?.actionsVerticalDirection,
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
      descriptionTextAlign:
          t < 0.5 ? a?.descriptionTextAlign : b?.descriptionTextAlign,
      alignment: Alignment.lerp(a?.alignment, b?.alignment, t),
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      scrollable: t < 0.5 ? a?.scrollable : b?.scrollable,
      scrollPadding: EdgeInsetsGeometry.lerp(
        a?.scrollPadding,
        b?.scrollPadding,
        t,
      ),
      isHeaderPinned: t < 0.5 ? a?.isHeaderPinned : b?.isHeaderPinned,
      isActionsPinned: t < 0.5 ? a?.isActionsPinned : b?.isActionsPinned,
      actionsGap: lerpDouble$(a?.actionsGap, b?.actionsGap, t),
      useSafeArea: t < 0.5 ? a?.useSafeArea : b?.useSafeArea,
    );
  }

  ShadDialogTheme copyWith({
    IconData? closeIconData,
    ShadPosition? closeIconPosition,
    BorderRadius? radius,
    Color? backgroundColor,
    bool? expandActionsWhenTiny,
    EdgeInsetsGeometry? padding,
    double? gap,
    List<Effect<dynamic>>? animateIn,
    List<Effect<dynamic>>? animateOut,
    BoxConstraints? constraints,
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
    Alignment? alignment,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    bool? scrollable,
    EdgeInsetsGeometry? scrollPadding,
    bool? isHeaderPinned,
    bool? isActionsPinned,
    double? actionsGap,
    bool? useSafeArea,
  }) {
    final a = (this as ShadDialogTheme);

    return ShadDialogTheme(
      closeIconData: closeIconData ?? a.closeIconData,
      closeIconPosition: closeIconPosition ?? a.closeIconPosition,
      radius: radius ?? a.radius,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      expandActionsWhenTiny: expandActionsWhenTiny ?? a.expandActionsWhenTiny,
      padding: padding ?? a.padding,
      gap: gap ?? a.gap,
      animateIn: animateIn ?? a.animateIn,
      animateOut: animateOut ?? a.animateOut,
      constraints: constraints ?? a.constraints,
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
      alignment: alignment ?? a.alignment,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      scrollable: scrollable ?? a.scrollable,
      scrollPadding: scrollPadding ?? a.scrollPadding,
      isHeaderPinned: isHeaderPinned ?? a.isHeaderPinned,
      isActionsPinned: isActionsPinned ?? a.isActionsPinned,
      actionsGap: actionsGap ?? a.actionsGap,
      useSafeArea: useSafeArea ?? a.useSafeArea,
    );
  }

  ShadDialogTheme merge(ShadDialogTheme? other) {
    final current = (this as ShadDialogTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

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
      alignment: other.alignment,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      scrollable: other.scrollable,
      scrollPadding: other.scrollPadding,
      isHeaderPinned: other.isHeaderPinned,
      isActionsPinned: other.isActionsPinned,
      actionsGap: other.actionsGap,
      useSafeArea: other.useSafeArea,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadDialogTheme);

    return other is ShadDialogTheme &&
        other.closeIconData == value.closeIconData &&
        other.closeIconPosition == value.closeIconPosition &&
        other.radius == value.radius &&
        other.backgroundColor == value.backgroundColor &&
        other.expandActionsWhenTiny == value.expandActionsWhenTiny &&
        other.padding == value.padding &&
        other.gap == value.gap &&
        other.animateIn == value.animateIn &&
        other.animateOut == value.animateOut &&
        other.constraints == value.constraints &&
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
        other.alignment == value.alignment &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.scrollable == value.scrollable &&
        other.scrollPadding == value.scrollPadding &&
        other.isHeaderPinned == value.isHeaderPinned &&
        other.isActionsPinned == value.isActionsPinned &&
        other.actionsGap == value.actionsGap &&
        other.useSafeArea == value.useSafeArea;
  }

  @override
  int get hashCode {
    final value = (this as ShadDialogTheme);

    return Object.hashAll([
      runtimeType,
      value.closeIconData,
      value.closeIconPosition,
      value.radius,
      value.backgroundColor,
      value.expandActionsWhenTiny,
      value.padding,
      value.gap,
      value.animateIn,
      value.animateOut,
      value.constraints,
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
      value.alignment,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.scrollable,
      value.scrollPadding,
      value.isHeaderPinned,
      value.isActionsPinned,
      value.actionsGap,
      value.useSafeArea,
    ]);
  }
}
