import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/text_theme/base.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_defaults.dart';

@immutable
class ShadcnTextThemeData extends ShadcnBaseTextTheme {
  factory ShadcnTextThemeData({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? p,
    TextStyle? blockquote,
    TextStyle? table,
    TextStyle? list,
    TextStyle? lead,
    TextStyle? large,
    TextStyle? small,
    TextStyle? muted,
  }) {
    return ShadcnTextThemeData._internal(
      h1: ShadcnTextDefaultTheme.h1().merge(h1),
      h2: ShadcnTextDefaultTheme.h2().merge(h2),
      h3: ShadcnTextDefaultTheme.h3().merge(h3),
      h4: ShadcnTextDefaultTheme.h4().merge(h4),
      p: ShadcnTextDefaultTheme.p().merge(p),
      blockquote: ShadcnTextDefaultTheme.blockquote().merge(blockquote),
      table: ShadcnTextDefaultTheme.table().merge(table),
      list: ShadcnTextDefaultTheme.list().merge(list),
      lead: ShadcnTextDefaultTheme.lead().merge(lead),
      large: ShadcnTextDefaultTheme.large().merge(large),
      small: ShadcnTextDefaultTheme.small().merge(small),
      muted: ShadcnTextDefaultTheme.muted().merge(muted),
    );
  }

  const ShadcnTextThemeData._internal({
    required super.h1,
    required super.h2,
    required super.h3,
    required super.h4,
    required super.p,
    required super.blockquote,
    required super.table,
    required super.list,
    required super.lead,
    required super.large,
    required super.small,
    required super.muted,
  });

  ShadcnTextThemeData copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? p,
    TextStyle? blockquote,
    TextStyle? table,
    TextStyle? list,
    TextStyle? lead,
    TextStyle? large,
    TextStyle? small,
    TextStyle? muted,
  }) {
    return ShadcnTextThemeData(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      p: p ?? this.p,
      blockquote: blockquote ?? this.blockquote,
      table: table ?? this.table,
      list: list ?? this.list,
      lead: lead ?? this.lead,
      large: large ?? this.large,
      small: small ?? this.small,
      muted: muted ?? this.muted,
    );
  }

  ShadcnTextThemeData mergeWith(ShadcnTextThemeData? other) {
    if (other == null) return this;
    return copyWith(
      h1: h1.merge(other.h1),
      h2: h2.merge(other.h2),
      h3: h3.merge(other.h3),
      h4: h4.merge(other.h4),
      p: p.merge(other.p),
      blockquote: blockquote.merge(other.blockquote),
      table: table.merge(other.table),
      list: list.merge(other.list),
      lead: lead.merge(other.lead),
      large: large.merge(other.large),
      small: small.merge(other.small),
      muted: muted.merge(other.muted),
    );
  }

  ShadcnTextThemeData apply({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor, // Change color source
    Color? bodyColor, // Change color source
    Color? decorationColor, // Change color source
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
  }) {
    return ShadcnTextThemeData(
      h1: h1.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h2: h2.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h3: h3.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h4: h4.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      p: p.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      blockquote: blockquote.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      table: table.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      list: list.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      lead: lead.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      large: large.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        color: bodyColor, // TODO: Change color source
      ),
      small: small.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        color: bodyColor, // TODO: Change color source
      ),
      muted: muted.apply(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor, // TODO: Change color source
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
    );
  }

  static ShadcnTextThemeData lerp(
    ShadcnTextThemeData? a,
    ShadcnTextThemeData? b,
    double t,
  ) {
    if (identical(a, b) && a != null) {
      return a;
    }
    return ShadcnTextThemeData(
      h1: TextStyle.lerp(a?.h1, b?.h1, t),
      h2: TextStyle.lerp(a?.h2, b?.h2, t),
      h3: TextStyle.lerp(a?.h3, b?.h3, t),
      h4: TextStyle.lerp(a?.h4, b?.h4, t),
      p: TextStyle.lerp(a?.p, b?.p, t),
      blockquote: TextStyle.lerp(a?.blockquote, b?.blockquote, t),
      table: TextStyle.lerp(a?.table, b?.table, t),
      list: TextStyle.lerp(a?.list, b?.list, t),
      lead: TextStyle.lerp(a?.lead, b?.lead, t),
      large: TextStyle.lerp(a?.large, b?.large, t),
      small: TextStyle.lerp(a?.small, b?.small, t),
      muted: TextStyle.lerp(a?.muted, b?.muted, t),
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
    return other is ShadcnTextThemeData &&
        other.h1 == h1 &&
        other.h2 == h2 &&
        other.h3 == h3 &&
        other.h4 == h4 &&
        other.p == p &&
        other.blockquote == blockquote &&
        other.table == table &&
        other.list == list &&
        other.lead == lead &&
        other.large == large &&
        other.small == small &&
        other.muted == muted;
  }

  @override
  int get hashCode {
    return Object.hash(
      h1,
      h2,
      h3,
      h4,
      p,
      blockquote,
      table,
      list,
      lead,
      large,
      small,
      muted,
    );
  }
}
