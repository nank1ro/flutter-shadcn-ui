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
    final a = (this as ShadToastTheme);

    return ShadToastTheme(
      backgroundColor: backgroundColor ?? a.backgroundColor,
      closeIconData: closeIconData ?? a.closeIconData,
      alignment: alignment ?? a.alignment,
      offset: offset ?? a.offset,
      duration: duration ?? a.duration,
      animateIn: animateIn ?? a.animateIn,
      animateOut: animateOut ?? a.animateOut,
      textDirection: textDirection ?? a.textDirection,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      showCloseIconOnlyWhenHovered:
          showCloseIconOnlyWhenHovered ?? a.showCloseIconOnlyWhenHovered,
      titleStyle: titleStyle ?? a.titleStyle,
      descriptionStyle: descriptionStyle ?? a.descriptionStyle,
      actionPadding: actionPadding ?? a.actionPadding,
      border: border ?? a.border,
      radius: radius ?? a.radius,
      shadows: shadows ?? a.shadows,
      padding: padding ?? a.padding,
      closeIconPosition: closeIconPosition ?? a.closeIconPosition,
      constraints: constraints ?? a.constraints,
      closeIcon: closeIcon ?? a.closeIcon,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? a.mainAxisSize,
    );
  }

  ShadToastTheme merge(ShadToastTheme? other) {
    final current = (this as ShadToastTheme);

    if (other == null) {
      return current;
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
      titleStyle:
          current.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          current.descriptionStyle?.merge(other.descriptionStyle) ??
              other.descriptionStyle,
      actionPadding: other.actionPadding,
      border: current.border?.merge(other.border) ?? other.border,
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

    final value = (this as ShadToastTheme);

    return other is ShadToastTheme &&
        other.backgroundColor == value.backgroundColor &&
        other.closeIconData == value.closeIconData &&
        other.alignment == value.alignment &&
        other.offset == value.offset &&
        other.duration == value.duration &&
        other.animateIn == value.animateIn &&
        other.animateOut == value.animateOut &&
        other.textDirection == value.textDirection &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.showCloseIconOnlyWhenHovered ==
            value.showCloseIconOnlyWhenHovered &&
        other.titleStyle == value.titleStyle &&
        other.descriptionStyle == value.descriptionStyle &&
        other.actionPadding == value.actionPadding &&
        other.border == value.border &&
        other.radius == value.radius &&
        other.shadows == value.shadows &&
        other.padding == value.padding &&
        other.closeIconPosition == value.closeIconPosition &&
        other.constraints == value.constraints &&
        other.closeIcon == value.closeIcon &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.mainAxisSize == value.mainAxisSize;
  }

  @override
  int get hashCode {
    final value = (this as ShadToastTheme);

    return Object.hashAll([
      runtimeType,
      value.backgroundColor,
      value.closeIconData,
      value.alignment,
      value.offset,
      value.duration,
      value.animateIn,
      value.animateOut,
      value.textDirection,
      value.crossAxisAlignment,
      value.showCloseIconOnlyWhenHovered,
      value.titleStyle,
      value.descriptionStyle,
      value.actionPadding,
      value.border,
      value.radius,
      value.shadows,
      value.padding,
      value.closeIconPosition,
      value.constraints,
      value.closeIcon,
      value.mainAxisAlignment,
      value.mainAxisSize,
    ]);
  }
}
