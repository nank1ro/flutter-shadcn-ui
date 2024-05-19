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
  });

  final bool merge;
  final ShadDecoration? decoration;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final Size? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

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
  }) {
    return ShadAlertTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      iconPadding: iconPadding ?? this.iconPadding,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
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
        other.descriptionStyle == descriptionStyle;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        iconPadding.hashCode ^
        iconColor.hashCode ^
        iconSize.hashCode ^
        titleStyle.hashCode ^
        descriptionStyle.hashCode;
  }
}
