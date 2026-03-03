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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadDialogTheme(
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
      animateIn: t < 0.5 ? a.animateIn : b.animateIn,
      animateOut: t < 0.5 ? a.animateOut : b.animateOut,
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
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
      alignment: Alignment.lerp(a.alignment, b.alignment, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      scrollable: t < 0.5 ? a.scrollable : b.scrollable,
      scrollPadding: EdgeInsetsGeometry.lerp(
        a.scrollPadding,
        b.scrollPadding,
        t,
      ),
      actionsGap: lerpDouble$(a.actionsGap, b.actionsGap, t),
      useSafeArea: t < 0.5 ? a.useSafeArea : b.useSafeArea,
      titlePinned: t < 0.5 ? a.titlePinned : b.titlePinned,
      descriptionPinned: t < 0.5 ? a.descriptionPinned : b.descriptionPinned,
      actionsPinned: t < 0.5 ? a.actionsPinned : b.actionsPinned,
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
    double? actionsGap,
    bool? useSafeArea,
    bool? titlePinned,
    bool? descriptionPinned,
    bool? actionsPinned,
  }) {
    final _this = (this as ShadDialogTheme);

    return ShadDialogTheme(
      closeIconData: closeIconData ?? _this.closeIconData,
      closeIconPosition: closeIconPosition ?? _this.closeIconPosition,
      radius: radius ?? _this.radius,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      expandActionsWhenTiny:
          expandActionsWhenTiny ?? _this.expandActionsWhenTiny,
      padding: padding ?? _this.padding,
      gap: gap ?? _this.gap,
      animateIn: animateIn ?? _this.animateIn,
      animateOut: animateOut ?? _this.animateOut,
      constraints: constraints ?? _this.constraints,
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
      alignment: alignment ?? _this.alignment,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      scrollable: scrollable ?? _this.scrollable,
      scrollPadding: scrollPadding ?? _this.scrollPadding,
      actionsGap: actionsGap ?? _this.actionsGap,
      useSafeArea: useSafeArea ?? _this.useSafeArea,
      titlePinned: titlePinned ?? _this.titlePinned,
      descriptionPinned: descriptionPinned ?? _this.descriptionPinned,
      actionsPinned: actionsPinned ?? _this.actionsPinned,
    );
  }

  ShadDialogTheme merge(ShadDialogTheme? other) {
    final _this = (this as ShadDialogTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          _this.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
      titleTextAlign: other.titleTextAlign,
      descriptionTextAlign: other.descriptionTextAlign,
      alignment: other.alignment,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      scrollable: other.scrollable,
      scrollPadding: other.scrollPadding,
      actionsGap: other.actionsGap,
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

    final _this = (this as ShadDialogTheme);
    final _other = (other as ShadDialogTheme);

    return _other.closeIconData == _this.closeIconData &&
        _other.closeIconPosition == _this.closeIconPosition &&
        _other.radius == _this.radius &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.expandActionsWhenTiny == _this.expandActionsWhenTiny &&
        _other.padding == _this.padding &&
        _other.gap == _this.gap &&
        _other.animateIn == _this.animateIn &&
        _other.animateOut == _this.animateOut &&
        _other.constraints == _this.constraints &&
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
        _other.alignment == _this.alignment &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.scrollable == _this.scrollable &&
        _other.scrollPadding == _this.scrollPadding &&
        _other.actionsGap == _this.actionsGap &&
        _other.useSafeArea == _this.useSafeArea &&
        _other.titlePinned == _this.titlePinned &&
        _other.descriptionPinned == _this.descriptionPinned &&
        _other.actionsPinned == _this.actionsPinned;
  }

  @override
  int get hashCode {
    final _this = (this as ShadDialogTheme);

    return Object.hashAll([
      runtimeType,
      _this.closeIconData,
      _this.closeIconPosition,
      _this.radius,
      _this.backgroundColor,
      _this.expandActionsWhenTiny,
      _this.padding,
      _this.gap,
      _this.animateIn,
      _this.animateOut,
      _this.constraints,
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
      _this.alignment,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.scrollable,
      _this.scrollPadding,
      _this.actionsGap,
      _this.useSafeArea,
      _this.titlePinned,
      _this.descriptionPinned,
      _this.actionsPinned,
    ]);
  }
}
