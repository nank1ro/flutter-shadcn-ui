// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'toast.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadToastTheme {
  bool get canMerge => true;

  static ShadToastTheme? lerp(ShadToastTheme? a, ShadToastTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadToastTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      closeIconData: t < 0.5 ? a?.closeIconData : b?.closeIconData,
      alignment: Alignment.lerp(a?.alignment, b?.alignment, t),
      offset: Offset.lerp(a?.offset, b?.offset, t),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      animateIn: t < 0.5 ? a?.animateIn : b?.animateIn,
      animateOut: t < 0.5 ? a?.animateOut : b?.animateOut,
      textDirection: t < 0.5 ? a?.textDirection : b?.textDirection,
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      showCloseIconOnlyWhenHovered: t < 0.5
          ? a?.showCloseIconOnlyWhenHovered
          : b?.showCloseIconOnlyWhenHovered,
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a?.descriptionStyle,
        b?.descriptionStyle,
        t,
      ),
      actionPadding: EdgeInsetsGeometry.lerp(
        a?.actionPadding,
        b?.actionPadding,
        t,
      ),
      border: ShadBorder.lerp(a?.border, b?.border, t),
      radius: BorderRadius.lerp(a?.radius, b?.radius, t),
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      closeIconPosition: ShadPosition.lerp(
        a?.closeIconPosition,
        b?.closeIconPosition,
        t,
      ),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      closeIcon: t < 0.5 ? a?.closeIcon : b?.closeIcon,
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      mainAxisSize: t < 0.5 ? a?.mainAxisSize : b?.mainAxisSize,
    );
  }

  ShadToastTheme copyWith({
    Color? backgroundColor,
    IconData? closeIconData,
    Alignment? alignment,
    Offset? offset,
    Duration? duration,
    List<Effect<dynamic>>? animateIn,
    List<Effect<dynamic>>? animateOut,
    TextDirection? textDirection,
    CrossAxisAlignment? crossAxisAlignment,
    bool? showCloseIconOnlyWhenHovered,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    EdgeInsetsGeometry? actionPadding,
    ShadBorder? border,
    BorderRadius? radius,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    ShadPosition? closeIconPosition,
    BoxConstraints? constraints,
    Widget? closeIcon,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    final _this = (this as ShadToastTheme);

    return ShadToastTheme(
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      closeIconData: closeIconData ?? _this.closeIconData,
      alignment: alignment ?? _this.alignment,
      offset: offset ?? _this.offset,
      duration: duration ?? _this.duration,
      animateIn: animateIn ?? _this.animateIn,
      animateOut: animateOut ?? _this.animateOut,
      textDirection: textDirection ?? _this.textDirection,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      showCloseIconOnlyWhenHovered:
          showCloseIconOnlyWhenHovered ?? _this.showCloseIconOnlyWhenHovered,
      titleStyle: titleStyle ?? _this.titleStyle,
      descriptionStyle: descriptionStyle ?? _this.descriptionStyle,
      actionPadding: actionPadding ?? _this.actionPadding,
      border: border ?? _this.border,
      radius: radius ?? _this.radius,
      shadows: shadows ?? _this.shadows,
      padding: padding ?? _this.padding,
      closeIconPosition: closeIconPosition ?? _this.closeIconPosition,
      constraints: constraints ?? _this.constraints,
      closeIcon: closeIcon ?? _this.closeIcon,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? _this.mainAxisSize,
    );
  }

  ShadToastTheme merge(ShadToastTheme? other) {
    final _this = (this as ShadToastTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      closeIconData: other.closeIconData,
      alignment: other.alignment,
      offset: other.offset,
      duration: other.duration,
      animateIn: other.animateIn,
      animateOut: other.animateOut,
      textDirection: other.textDirection,
      crossAxisAlignment: other.crossAxisAlignment,
      showCloseIconOnlyWhenHovered: other.showCloseIconOnlyWhenHovered,
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle: _this.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
      actionPadding: other.actionPadding,
      border: _this.border?.merge(other.border) ?? other.border,
      radius: other.radius,
      shadows: other.shadows,
      padding: other.padding,
      closeIconPosition: other.closeIconPosition,
      constraints: other.constraints,
      closeIcon: other.closeIcon,
      mainAxisAlignment: other.mainAxisAlignment,
      mainAxisSize: other.mainAxisSize,
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

    final _this = (this as ShadToastTheme);
    final _other = (other as ShadToastTheme);

    return _other.backgroundColor == _this.backgroundColor &&
        _other.closeIconData == _this.closeIconData &&
        _other.alignment == _this.alignment &&
        _other.offset == _this.offset &&
        _other.duration == _this.duration &&
        _other.animateIn == _this.animateIn &&
        _other.animateOut == _this.animateOut &&
        _other.textDirection == _this.textDirection &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.showCloseIconOnlyWhenHovered ==
            _this.showCloseIconOnlyWhenHovered &&
        _other.titleStyle == _this.titleStyle &&
        _other.descriptionStyle == _this.descriptionStyle &&
        _other.actionPadding == _this.actionPadding &&
        _other.border == _this.border &&
        _other.radius == _this.radius &&
        _other.shadows == _this.shadows &&
        _other.padding == _this.padding &&
        _other.closeIconPosition == _this.closeIconPosition &&
        _other.constraints == _this.constraints &&
        _other.closeIcon == _this.closeIcon &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.mainAxisSize == _this.mainAxisSize;
  }

  @override
  int get hashCode {
    final _this = (this as ShadToastTheme);

    return Object.hashAll([
      runtimeType,
      _this.backgroundColor,
      _this.closeIconData,
      _this.alignment,
      _this.offset,
      _this.duration,
      _this.animateIn,
      _this.animateOut,
      _this.textDirection,
      _this.crossAxisAlignment,
      _this.showCloseIconOnlyWhenHovered,
      _this.titleStyle,
      _this.descriptionStyle,
      _this.actionPadding,
      _this.border,
      _this.radius,
      _this.shadows,
      _this.padding,
      _this.closeIconPosition,
      _this.constraints,
      _this.closeIcon,
      _this.mainAxisAlignment,
      _this.mainAxisSize,
    ]);
  }
}
