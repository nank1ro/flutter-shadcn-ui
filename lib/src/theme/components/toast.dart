import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/utils/position.dart';

@immutable
class ShadToastTheme {
  const ShadToastTheme({
    this.merge = true,
    this.backgroundColor,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration,
    this.animateIn,
    this.animateOut,
    this.textDirection,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.padding,
    this.closeIconPosition,
    this.constraints,
    this.closeIcon,
    this.mainAxisAlignment,
    this.mainAxisSize,
  });

  final bool merge;

  /// {@macro ShadToast.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadToast.closeIconData}
  final IconData? closeIconData;

  /// {@macro ShadToast.alignment}
  final Alignment? alignment;

  /// {@macro ShadToast.offset}
  final Offset? offset;

  /// {@macro ShadToast.duration}
  final Duration? duration;

  /// {@macro ShadToast.animateIn}
  final List<Effect<dynamic>>? animateIn;

  /// {@macro ShadToast.animateOut}
  final List<Effect<dynamic>>? animateOut;

  /// {@macro ShadToast.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadToast.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadToast.showCloseIconOnlyWhenHovered}
  final bool? showCloseIconOnlyWhenHovered;

  /// {@macro ShadToast.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ShadToast.descriptionStyle}
  final TextStyle? descriptionStyle;

  /// {@macro ShadToast.actionPadding}
  final EdgeInsetsGeometry? actionPadding;

  /// {@macro ShadToast.border}
  final Border? border;

  /// {@macro ShadToast.radius}
  final BorderRadius? radius;

  /// {@macro ShadToast.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadToast.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadToast.closeIconPosition}
  final ShadPosition? closeIconPosition;

  /// {@macro ShadToast.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadToast.closeIcon}
  final Widget? closeIcon;

  /// {@macro ShadToast.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadToast.mainAxisSize}
  final MainAxisSize? mainAxisSize;

  static ShadToastTheme lerp(
    ShadToastTheme a,
    ShadToastTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadToastTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      closeIconData: t < .5 ? a.closeIconData : b.closeIconData,
      alignment: Alignment.lerp(a.alignment, b.alignment, t),
      offset: Offset.lerp(a.offset, b.offset, t),
      duration: t < .5 ? a.duration : b.duration,
      animateIn: t < .5 ? a.animateIn : b.animateIn,
      animateOut: t < .5 ? a.animateOut : b.animateOut,
      textDirection: t < .5 ? a.textDirection : b.textDirection,
      crossAxisAlignment: t < .5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      showCloseIconOnlyWhenHovered: t < .5
          ? a.showCloseIconOnlyWhenHovered
          : b.showCloseIconOnlyWhenHovered,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle:
          TextStyle.lerp(a.descriptionStyle, b.descriptionStyle, t),
      actionPadding:
          EdgeInsetsGeometry.lerp(a.actionPadding, b.actionPadding, t),
      border: Border.lerp(a.border, b.border, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      shadows: t < .5 ? a.shadows : b.shadows,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      closeIconPosition:
          ShadPosition.lerp(a.closeIconPosition, b.closeIconPosition, t),
      constraints: t < .5 ? a.constraints : b.constraints,
      closeIcon: t < .5 ? a.closeIcon : b.closeIcon,
      mainAxisAlignment: t < .5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      mainAxisSize: t < .5 ? a.mainAxisSize : b.mainAxisSize,
    );
  }

  ShadToastTheme copyWith({
    bool? merge,
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
    Border? border,
    BorderRadius? radius,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    ShadPosition? closeIconPosition,
    BoxConstraints? constraints,
    Widget? closeIcon,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return ShadToastTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      closeIconData: closeIconData ?? this.closeIconData,
      alignment: alignment ?? this.alignment,
      offset: offset ?? this.offset,
      duration: duration ?? this.duration,
      animateIn: animateIn ?? this.animateIn,
      animateOut: animateOut ?? this.animateOut,
      textDirection: textDirection ?? this.textDirection,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      showCloseIconOnlyWhenHovered:
          showCloseIconOnlyWhenHovered ?? this.showCloseIconOnlyWhenHovered,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      actionPadding: actionPadding ?? this.actionPadding,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      shadows: shadows ?? this.shadows,
      padding: padding ?? this.padding,
      closeIconPosition: closeIconPosition ?? this.closeIconPosition,
      constraints: constraints ?? this.constraints,
      closeIcon: closeIcon ?? this.closeIcon,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
    );
  }

  ShadToastTheme mergeWith(ShadToastTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
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
      titleStyle: other.titleStyle,
      descriptionStyle: other.descriptionStyle,
      actionPadding: other.actionPadding,
      border: other.border,
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
    if (identical(this, other)) return true;

    return other is ShadToastTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.closeIconData == closeIconData &&
        other.alignment == alignment &&
        other.offset == offset &&
        other.duration == duration &&
        listEquals(other.animateIn, animateIn) &&
        listEquals(other.animateOut, animateOut) &&
        other.textDirection == textDirection &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.showCloseIconOnlyWhenHovered == showCloseIconOnlyWhenHovered &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.actionPadding == actionPadding &&
        other.border == border &&
        other.radius == radius &&
        listEquals(other.shadows, shadows) &&
        other.padding == padding &&
        other.closeIconPosition == closeIconPosition &&
        other.constraints == constraints &&
        other.closeIcon == closeIcon &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.mainAxisSize == mainAxisSize;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        backgroundColor.hashCode ^
        closeIconData.hashCode ^
        alignment.hashCode ^
        offset.hashCode ^
        duration.hashCode ^
        animateIn.hashCode ^
        animateOut.hashCode ^
        textDirection.hashCode ^
        crossAxisAlignment.hashCode ^
        showCloseIconOnlyWhenHovered.hashCode ^
        titleStyle.hashCode ^
        descriptionStyle.hashCode ^
        actionPadding.hashCode ^
        border.hashCode ^
        radius.hashCode ^
        shadows.hashCode ^
        padding.hashCode ^
        closeIconPosition.hashCode ^
        constraints.hashCode ^
        closeIcon.hashCode ^
        mainAxisAlignment.hashCode ^
        mainAxisSize.hashCode;
  }
}
