import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadSidebarTheme {
  const ShadSidebarTheme({
    this.merge = true,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.ringColor,
    this.accentColor,
    this.accentForegroundColor,
    this.primaryColor,
    this.primaryForegroundColor,
  });

  final bool merge;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final Color? borderColor;

  final Color? ringColor;

  final Color? accentColor;

  final Color? accentForegroundColor;

  final Color? primaryColor;

  final Color? primaryForegroundColor;

  static ShadSidebarTheme lerp(
    ShadSidebarTheme a,
    ShadSidebarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSidebarTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      borderColor: Color.lerp(a.borderColor, b.borderColor, t),
      ringColor: Color.lerp(a.ringColor, b.ringColor, t),
      accentColor: Color.lerp(a.accentColor, b.accentColor, t),
      accentForegroundColor:
          Color.lerp(a.accentForegroundColor, b.accentForegroundColor, t),
      primaryColor: Color.lerp(a.primaryColor, b.primaryColor, t),
      primaryForegroundColor:
          Color.lerp(a.primaryForegroundColor, b.primaryForegroundColor, t),
    );
  }

  ShadSidebarTheme copyWith({
    bool? merge,
    ShadSidebarVariant? variant,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? ringColor,
    Color? accentColor,
    Color? accentForegroundColor,
    Color? primaryColor,
    Color? primaryForegroundColor,
  }) {
    return ShadSidebarTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
      ringColor: ringColor ?? this.ringColor,
      accentColor: accentColor ?? this.accentColor,
      accentForegroundColor:
          accentForegroundColor ?? this.accentForegroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryForegroundColor:
          primaryForegroundColor ?? this.primaryForegroundColor,
    );
  }

  ShadSidebarTheme mergeWith(ShadSidebarTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      borderColor: other.borderColor,
      merge: other.merge,
      ringColor: other.ringColor,
      accentColor: other.accentColor,
      accentForegroundColor: other.accentForegroundColor,
      primaryColor: other.primaryColor,
      primaryForegroundColor: other.primaryForegroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSidebarTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.borderColor == borderColor &&
        other.ringColor == ringColor &&
        other.accentColor == accentColor &&
        other.accentForegroundColor == accentForegroundColor &&
        other.primaryColor == primaryColor &&
        other.primaryForegroundColor == primaryForegroundColor;
  }

  @override
  int get hashCode =>
      merge.hashCode ^
      backgroundColor.hashCode ^
      foregroundColor.hashCode ^
      borderColor.hashCode ^
      ringColor.hashCode ^
      accentColor.hashCode ^
      accentForegroundColor.hashCode ^
      primaryColor.hashCode ^
      primaryForegroundColor.hashCode;
}
