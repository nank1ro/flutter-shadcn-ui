import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadAlertTheme {
  const ShadAlertTheme({
    this.merge = true,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final bool merge;
  final ShadDecoration? decoration;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final Size? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

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
      iconSize: Size.lerp(a.iconSize, b.iconSize, t),
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle:
          TextStyle.lerp(a.descriptionStyle, b.descriptionStyle, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
    );
  }

  ShadAlertTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? iconPadding,
    Color? iconColor,
    Size? iconSize,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return ShadAlertTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      iconPadding: iconPadding ?? this.iconPadding,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }

  ShadAlertTheme mergeWith(ShadAlertTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      iconPadding: other.iconPadding,
      iconColor: other.iconColor,
      iconSize: other.iconSize,
      titleStyle: other.titleStyle,
      descriptionStyle: other.descriptionStyle,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
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
        other.iconSize == iconSize &&
        other.titleStyle == titleStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        iconPadding.hashCode ^
        iconColor.hashCode ^
        iconSize.hashCode ^
        titleStyle.hashCode ^
        descriptionStyle.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode;
  }
}
