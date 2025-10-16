// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sidebar_scaffold.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSidebarScaffoldTheme {
  bool get canMerge => true;

  static ShadSidebarScaffoldTheme? lerp(
    ShadSidebarScaffoldTheme? a,
    ShadSidebarScaffoldTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSidebarScaffoldTheme(
      bodyBackgroundColor: Color.lerp(
        a?.bodyBackgroundColor,
        b?.bodyBackgroundColor,
        t,
      ),
    );
  }

  ShadSidebarScaffoldTheme copyWith({Color? bodyBackgroundColor}) {
    final a = (this as ShadSidebarScaffoldTheme);

    return ShadSidebarScaffoldTheme(
      bodyBackgroundColor: bodyBackgroundColor ?? a.bodyBackgroundColor,
    );
  }

  ShadSidebarScaffoldTheme merge(ShadSidebarScaffoldTheme? other) {
    final current = (this as ShadSidebarScaffoldTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(bodyBackgroundColor: other.bodyBackgroundColor);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadSidebarScaffoldTheme);

    return other is ShadSidebarScaffoldTheme &&
        other.bodyBackgroundColor == value.bodyBackgroundColor;
  }

  @override
  int get hashCode {
    final value = (this as ShadSidebarScaffoldTheme);

    return Object.hash(runtimeType, value.bodyBackgroundColor);
  }
}
