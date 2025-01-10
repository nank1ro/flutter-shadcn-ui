import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

@immutable
class ShadAlertTheme {
  const ShadAlertTheme({
    this.merge = true,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.orderPolicy,
  });

  final bool merge;
  final ShadDecoration? decoration;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadAlert.orderPolicy}
  final WidgetOrderPolicy? orderPolicy;

  static ShadAlertTheme lerp(
    ShadAlertTheme a,
    ShadAlertTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadAlertTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      iconPadding: EdgeInsets.lerp(a.iconPadding, b.iconPadding, t),
      iconColor: Color.lerp(a.iconColor, b.iconColor, t),
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle:
          TextStyle.lerp(a.descriptionStyle, b.descriptionStyle, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      orderPolicy: t < .5 ? a.orderPolicy : b.orderPolicy,
    );
  }

  ShadAlertTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? iconPadding,
    Color? iconColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    WidgetOrderPolicy? orderPolicy,
  }) {
    return ShadAlertTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      iconPadding: iconPadding ?? this.iconPadding,
      iconColor: iconColor ?? this.iconColor,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      orderPolicy: orderPolicy ?? this.orderPolicy,
    );
  }

  ShadAlertTheme mergeWith(ShadAlertTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      iconPadding: other.iconPadding,
      iconColor: other.iconColor,
      titleStyle: other.titleStyle,
      descriptionStyle: other.descriptionStyle,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      orderPolicy: other.orderPolicy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAlertTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.iconPadding == iconPadding &&
        other.iconColor == iconColor &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.orderPolicy == orderPolicy;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        iconPadding.hashCode ^
        iconColor.hashCode ^
        titleStyle.hashCode ^
        descriptionStyle.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        orderPolicy.hashCode;
  }
}
