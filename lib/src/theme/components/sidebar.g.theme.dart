// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sidebar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSidebarTheme {
  bool get canMerge => true;

  static ShadSidebarTheme? lerp(
    ShadSidebarTheme? a,
    ShadSidebarTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSidebarTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      ringColor: Color.lerp(a?.ringColor, b?.ringColor, t),
      accentColor: Color.lerp(a?.accentColor, b?.accentColor, t),
      accentForegroundColor: Color.lerp(
        a?.accentForegroundColor,
        b?.accentForegroundColor,
        t,
      ),
      primaryColor: Color.lerp(a?.primaryColor, b?.primaryColor, t),
      primaryForegroundColor: Color.lerp(
        a?.primaryForegroundColor,
        b?.primaryForegroundColor,
        t,
      ),
    );
  }

  ShadSidebarTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? ringColor,
    Color? accentColor,
    Color? accentForegroundColor,
    Color? primaryColor,
    Color? primaryForegroundColor,
  }) {
    final a = (this as ShadSidebarTheme);

    return ShadSidebarTheme(
      backgroundColor: backgroundColor ?? a.backgroundColor,
      foregroundColor: foregroundColor ?? a.foregroundColor,
      borderColor: borderColor ?? a.borderColor,
      ringColor: ringColor ?? a.ringColor,
      accentColor: accentColor ?? a.accentColor,
      accentForegroundColor: accentForegroundColor ?? a.accentForegroundColor,
      primaryColor: primaryColor ?? a.primaryColor,
      primaryForegroundColor:
          primaryForegroundColor ?? a.primaryForegroundColor,
    );
  }

  ShadSidebarTheme merge(ShadSidebarTheme? other) {
    final current = (this as ShadSidebarTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      borderColor: other.borderColor,
      ringColor: other.ringColor,
      accentColor: other.accentColor,
      accentForegroundColor: other.accentForegroundColor,
      primaryColor: other.primaryColor,
      primaryForegroundColor: other.primaryForegroundColor,
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

    final value = (this as ShadSidebarTheme);

    return other is ShadSidebarTheme &&
        other.backgroundColor == value.backgroundColor &&
        other.foregroundColor == value.foregroundColor &&
        other.borderColor == value.borderColor &&
        other.ringColor == value.ringColor &&
        other.accentColor == value.accentColor &&
        other.accentForegroundColor == value.accentForegroundColor &&
        other.primaryColor == value.primaryColor &&
        other.primaryForegroundColor == value.primaryForegroundColor;
  }

  @override
  int get hashCode {
    final value = (this as ShadSidebarTheme);

    return Object.hash(
      runtimeType,
      value.backgroundColor,
      value.foregroundColor,
      value.borderColor,
      value.ringColor,
      value.accentColor,
      value.accentForegroundColor,
      value.primaryColor,
      value.primaryForegroundColor,
    );
  }
}
