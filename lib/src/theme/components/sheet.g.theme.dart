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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadSheetTheme(
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
      expandCrossSide: t < 0.5 ? a.expandCrossSide : b.expandCrossSide,
      closeIcon: t < 0.5 ? a.closeIcon : b.closeIcon,
      closeIconData: t < 0.5 ? a.closeIconData : b.closeIconData,
      closeIconPosition: ShadPosition.lerp(
        a.closeIconPosition,
        b.closeIconPosition,
        t,
      ),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      expandActionsWhenTiny: t < 0.5
          ? a.expandActionsWhenTiny
          : b.expandActionsWhenTiny,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      gap: lerpDouble$(a.gap, b.gap, t),
      actionsAxis: t < 0.5 ? a.actionsAxis : b.actionsAxis,
      actionsMainAxisSize: t < 0.5
          ? a.actionsMainAxisSize
          : b.actionsMainAxisSize,
      actionsMainAxisAlignment: t < 0.5
          ? a.actionsMainAxisAlignment
          : b.actionsMainAxisAlignment,
      actionsVerticalDirection: t < 0.5
          ? a.actionsVerticalDirection
          : b.actionsVerticalDirection,
      border: BoxBorder.lerp(a.border, b.border, t),
      shadows: t < 0.5 ? a.shadows : b.shadows,
      removeBorderRadiusWhenTiny: t < 0.5
          ? a.removeBorderRadiusWhenTiny
          : b.removeBorderRadiusWhenTiny,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a.descriptionStyle,
        b.descriptionStyle,
        t,
      ),
      titleTextAlign: t < 0.5 ? a.titleTextAlign : b.titleTextAlign,
      descriptionTextAlign: t < 0.5
          ? a.descriptionTextAlign
          : b.descriptionTextAlign,
      animateIn: t < 0.5 ? a.animateIn : b.animateIn,
      animateOut: t < 0.5 ? a.animateOut : b.animateOut,
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      scrollable: t < 0.5 ? a.scrollable : b.scrollable,
      scrollPadding: EdgeInsetsGeometry.lerp(
        a.scrollPadding,
        b.scrollPadding,
        t,
      ),
      disabledScrollControlMaxRatio: lerpDouble$(
        a.disabledScrollControlMaxRatio,
        b.disabledScrollControlMaxRatio,
        t,
      ),
      minFlingVelocity: lerpDouble$(a.minFlingVelocity, b.minFlingVelocity, t),
      closeProgressThreshold: lerpDouble$(
        a.closeProgressThreshold,
        b.closeProgressThreshold,
        t,
      ),
      side: t < 0.5 ? a.side : b.side,
      useSafeArea: t < 0.5 ? a.useSafeArea : b.useSafeArea,
      titlePinned: t < 0.5 ? a.titlePinned : b.titlePinned,
      descriptionPinned: t < 0.5 ? a.descriptionPinned : b.descriptionPinned,
      actionsPinned: t < 0.5 ? a.actionsPinned : b.actionsPinned,
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
    final _this = (this as ShadSheetTheme);

    return ShadSheetTheme(
      constraints: constraints ?? _this.constraints,
      expandCrossSide: expandCrossSide ?? _this.expandCrossSide,
      closeIcon: closeIcon ?? _this.closeIcon,
      closeIconData: closeIconData ?? _this.closeIconData,
      closeIconPosition: closeIconPosition ?? _this.closeIconPosition,
      radius: radius ?? _this.radius,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      expandActionsWhenTiny:
          expandActionsWhenTiny ?? _this.expandActionsWhenTiny,
      padding: padding ?? _this.padding,
      gap: gap ?? _this.gap,
      actionsAxis: actionsAxis ?? _this.actionsAxis,
      actionsMainAxisSize: actionsMainAxisSize ?? _this.actionsMainAxisSize,
      actionsMainAxisAlignment:
          actionsMainAxisAlignment ?? _this.actionsMainAxisAlignment,
      actionsVerticalDirection:
          actionsVerticalDirection ?? _this.actionsVerticalDirection,
      border: border ?? _this.border,
      shadows: shadows ?? _this.shadows,
      removeBorderRadiusWhenTiny:
          removeBorderRadiusWhenTiny ?? _this.removeBorderRadiusWhenTiny,
      titleStyle: titleStyle ?? _this.titleStyle,
      descriptionStyle: descriptionStyle ?? _this.descriptionStyle,
      titleTextAlign: titleTextAlign ?? _this.titleTextAlign,
      descriptionTextAlign: descriptionTextAlign ?? _this.descriptionTextAlign,
      animateIn: animateIn ?? _this.animateIn,
      animateOut: animateOut ?? _this.animateOut,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      scrollable: scrollable ?? _this.scrollable,
      scrollPadding: scrollPadding ?? _this.scrollPadding,
      disabledScrollControlMaxRatio:
          disabledScrollControlMaxRatio ?? _this.disabledScrollControlMaxRatio,
      minFlingVelocity: minFlingVelocity ?? _this.minFlingVelocity,
      closeProgressThreshold:
          closeProgressThreshold ?? _this.closeProgressThreshold,
      side: side ?? _this.side,
      useSafeArea: useSafeArea ?? _this.useSafeArea,
      titlePinned: titlePinned ?? _this.titlePinned,
      descriptionPinned: descriptionPinned ?? _this.descriptionPinned,
      actionsPinned: actionsPinned ?? _this.actionsPinned,
    );
  }

  ShadSheetTheme merge(ShadSheetTheme? other) {
    final _this = (this as ShadSheetTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          _this.descriptionStyle?.merge(other.descriptionStyle) ??
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadSheetTheme);
    final _other = (other as ShadSheetTheme);

    return _other.constraints == _this.constraints &&
        _other.expandCrossSide == _this.expandCrossSide &&
        _other.closeIcon == _this.closeIcon &&
        _other.closeIconData == _this.closeIconData &&
        _other.closeIconPosition == _this.closeIconPosition &&
        _other.radius == _this.radius &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.expandActionsWhenTiny == _this.expandActionsWhenTiny &&
        _other.padding == _this.padding &&
        _other.gap == _this.gap &&
        _other.actionsAxis == _this.actionsAxis &&
        _other.actionsMainAxisSize == _this.actionsMainAxisSize &&
        _other.actionsMainAxisAlignment == _this.actionsMainAxisAlignment &&
        _other.actionsVerticalDirection == _this.actionsVerticalDirection &&
        _other.border == _this.border &&
        _other.shadows == _this.shadows &&
        _other.removeBorderRadiusWhenTiny == _this.removeBorderRadiusWhenTiny &&
        _other.titleStyle == _this.titleStyle &&
        _other.descriptionStyle == _this.descriptionStyle &&
        _other.titleTextAlign == _this.titleTextAlign &&
        _other.descriptionTextAlign == _this.descriptionTextAlign &&
        _other.animateIn == _this.animateIn &&
        _other.animateOut == _this.animateOut &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.scrollable == _this.scrollable &&
        _other.scrollPadding == _this.scrollPadding &&
        _other.disabledScrollControlMaxRatio ==
            _this.disabledScrollControlMaxRatio &&
        _other.minFlingVelocity == _this.minFlingVelocity &&
        _other.closeProgressThreshold == _this.closeProgressThreshold &&
        _other.side == _this.side &&
        _other.useSafeArea == _this.useSafeArea &&
        _other.titlePinned == _this.titlePinned &&
        _other.descriptionPinned == _this.descriptionPinned &&
        _other.actionsPinned == _this.actionsPinned;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSheetTheme);

    return Object.hashAll([
      runtimeType,
      _this.constraints,
      _this.expandCrossSide,
      _this.closeIcon,
      _this.closeIconData,
      _this.closeIconPosition,
      _this.radius,
      _this.backgroundColor,
      _this.expandActionsWhenTiny,
      _this.padding,
      _this.gap,
      _this.actionsAxis,
      _this.actionsMainAxisSize,
      _this.actionsMainAxisAlignment,
      _this.actionsVerticalDirection,
      _this.border,
      _this.shadows,
      _this.removeBorderRadiusWhenTiny,
      _this.titleStyle,
      _this.descriptionStyle,
      _this.titleTextAlign,
      _this.descriptionTextAlign,
      _this.animateIn,
      _this.animateOut,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.scrollable,
      _this.scrollPadding,
      _this.disabledScrollControlMaxRatio,
      _this.minFlingVelocity,
      _this.closeProgressThreshold,
      _this.side,
      _this.useSafeArea,
      _this.titlePinned,
      _this.descriptionPinned,
      _this.actionsPinned,
    ]);
  }
}
