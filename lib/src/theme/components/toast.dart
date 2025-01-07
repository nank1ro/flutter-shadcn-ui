import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

import 'package:shadcn_ui/src/utils/position.dart';

@immutable
class ShadToastTheme {
  const ShadToastTheme({
    this.merge = true,
    this.backgroundColor,
    this.closeIconSrc,
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
    this.orderPolicy,
  });

  final bool merge;
  final Color? backgroundColor;
  final ShadImageSrc? closeIconSrc;
  final Alignment? alignment;
  final Offset? offset;
  final Duration? duration;
  final List<Effect<dynamic>>? animateIn;
  final List<Effect<dynamic>>? animateOut;
  final TextDirection? textDirection;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? showCloseIconOnlyWhenHovered;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? actionPadding;
  final Border? border;
  final BorderRadius? radius;
  final List<BoxShadow>? shadows;
  final EdgeInsets? padding;
  final ShadPosition? closeIconPosition;
  final BoxConstraints? constraints;
  final WidgetOrderPolicy? orderPolicy;

  static ShadToastTheme lerp(
    ShadToastTheme a,
    ShadToastTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadToastTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      closeIconSrc: t < .5 ? a.closeIconSrc : b.closeIconSrc,
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
      actionPadding: EdgeInsets.lerp(a.actionPadding, b.actionPadding, t),
      border: Border.lerp(a.border, b.border, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      shadows: t < .5 ? a.shadows : b.shadows,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      closeIconPosition:
          ShadPosition.lerp(a.closeIconPosition, b.closeIconPosition, t),
      constraints: t < .5 ? a.constraints : b.constraints,
      orderPolicy: t < .5 ? a.orderPolicy : b.orderPolicy,
    );
  }

  ShadToastTheme copyWith({
    bool? merge,
    Color? backgroundColor,
    ShadImageSrc? closeIconSrc,
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
    EdgeInsets? actionPadding,
    Border? border,
    BorderRadius? radius,
    List<BoxShadow>? shadows,
    EdgeInsets? padding,
    ShadPosition? closeIconPosition,
    BoxConstraints? constraints,
    WidgetOrderPolicy? orderPolicy,
  }) {
    return ShadToastTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      closeIconSrc: closeIconSrc ?? this.closeIconSrc,
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
      orderPolicy: orderPolicy ?? this.orderPolicy,
    );
  }

  ShadToastTheme mergeWith(ShadToastTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      closeIconSrc: other.closeIconSrc,
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
      orderPolicy: other.orderPolicy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadToastTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.closeIconSrc == closeIconSrc &&
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
        other.orderPolicy == orderPolicy;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        backgroundColor.hashCode ^
        closeIconSrc.hashCode ^
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
        orderPolicy.hashCode;
  }
}
