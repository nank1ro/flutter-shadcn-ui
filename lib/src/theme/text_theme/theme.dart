import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/text_theme/text_styles_default.dart';
import 'package:shadcn_ui/src/theme/themes/component_default.dart';

@immutable
class ShadTextTheme {
  factory ShadTextTheme({
    required ShadColorScheme colorScheme,
    TextStyle? h1Large,
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
    String? family,
    String? package,
  }) {
    var effectiveFamily = family ?? kDefaultFontFamily;
    if (package != null && package != '') {
      effectiveFamily = 'packages/$package/$effectiveFamily';
    }
    return ShadTextTheme.custom(
      h1Large: h1Large ??
          ShadTextDefaultTheme.h1Large(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      h1: h1 ??
          ShadTextDefaultTheme.h1(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      h2: h2 ??
          ShadTextDefaultTheme.h2(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      h3: h3 ??
          ShadTextDefaultTheme.h3(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      h4: h4 ??
          ShadTextDefaultTheme.h4(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      p: p ??
          ShadTextDefaultTheme.p(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      blockquote: blockquote ??
          ShadTextDefaultTheme.blockquote(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      table: table ??
          ShadTextDefaultTheme.table(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      list: list ??
          ShadTextDefaultTheme.list(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      lead: lead ??
          ShadTextDefaultTheme.lead(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      large: large ??
          ShadTextDefaultTheme.large(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      small: small ??
          ShadTextDefaultTheme.small(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      muted: muted ??
          ShadTextDefaultTheme.muted(
            colorScheme: colorScheme,
            family: effectiveFamily,
          ),
      family: effectiveFamily,
    );
  }

  const ShadTextTheme.custom({
    this.merge = true,
    required this.h1Large,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.p,
    required this.blockquote,
    required this.table,
    required this.list,
    required this.lead,
    required this.large,
    required this.small,
    required this.muted,
    required this.family,
  });

  factory ShadTextTheme.fromGoogleFont(
    TextStyle Function({
      TextStyle? textStyle,
    }) from, {
    required ShadColorScheme colorScheme,
    ShadTextTheme? textTheme,
  }) {
    final effectiveTextTheme = textTheme ??
        ShadComponentDefaultTheme.textTheme(colorScheme: colorScheme);
    final h1Large = from(textStyle: effectiveTextTheme.h1Large);
    return ShadTextTheme(
      colorScheme: colorScheme,
      h1Large: h1Large,
      h1: from(textStyle: effectiveTextTheme.h1),
      h2: from(textStyle: effectiveTextTheme.h2),
      h3: from(textStyle: effectiveTextTheme.h3),
      h4: from(textStyle: effectiveTextTheme.h4),
      p: from(textStyle: effectiveTextTheme.p),
      blockquote: from(textStyle: effectiveTextTheme.blockquote),
      table: from(textStyle: effectiveTextTheme.table),
      list: from(textStyle: effectiveTextTheme.list),
      lead: from(textStyle: effectiveTextTheme.lead),
      large: from(textStyle: effectiveTextTheme.large),
      small: from(textStyle: effectiveTextTheme.small),
      muted: from(textStyle: effectiveTextTheme.muted),
      family: h1Large.fontFamily ?? effectiveTextTheme.family,
    );
  }

  final TextStyle h1Large;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle p;
  final TextStyle blockquote;
  final TextStyle table;
  final TextStyle list;
  final TextStyle lead;
  final TextStyle large;
  final TextStyle small;
  final TextStyle muted;

  /// The font family of the theme.
  final String family;

  final bool merge;

  ShadTextTheme copyWith({
    TextStyle? h1Large,
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
    String? family,
    String? package,
  }) {
    var effectiveFamily = family ?? kDefaultFontFamily;
    if (package != null && package != '') {
      effectiveFamily = 'packages/$package/$effectiveFamily';
    }

    return ShadTextTheme.custom(
      merge: merge,
      h1Large: h1Large ?? this.h1Large,
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
      family: effectiveFamily,
    );
  }

  ShadTextTheme mergeWith(ShadTextTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;

    return copyWith(
      h1Large: h1Large.merge(other.h1Large),
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
      family: other.family,
    );
  }

  ShadTextTheme apply({
    String? family,
    List<String>? fontFamilyFallback,
    String? package,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor,
    Color? bodyColor,
    Color? decorationColor,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
  }) {
    final effectiveFamily = family ?? this.family;
    return ShadTextTheme.custom(
      merge: merge,
      family: effectiveFamily,
      h1Large: h1Large.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h1: h1.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h2: h2.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h3: h3.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      h4: h4.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      p: p.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      blockquote: blockquote.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      table: table.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      list: list.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      lead: lead.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
      large: large.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        color: bodyColor,
      ),
      small: small.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        color: bodyColor,
      ),
      muted: muted.apply(
        fontFamily: effectiveFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
    );
  }

  static ShadTextTheme lerp(
    ShadTextTheme? a,
    ShadTextTheme? b,
    double t,
  ) {
    if (identical(a, b) && a != null) {
      return a;
    }
    return ShadTextTheme.custom(
      h1Large: TextStyle.lerp(a!.h1Large, b!.h1Large, t)!,
      h1: TextStyle.lerp(a.h1, b.h1, t)!,
      h2: TextStyle.lerp(a.h2, b.h2, t)!,
      h3: TextStyle.lerp(a.h3, b.h3, t)!,
      h4: TextStyle.lerp(a.h4, b.h4, t)!,
      p: TextStyle.lerp(a.p, b.p, t)!,
      blockquote: TextStyle.lerp(a.blockquote, b.blockquote, t)!,
      table: TextStyle.lerp(a.table, b.table, t)!,
      list: TextStyle.lerp(a.list, b.list, t)!,
      lead: TextStyle.lerp(a.lead, b.lead, t)!,
      large: TextStyle.lerp(a.large, b.large, t)!,
      small: TextStyle.lerp(a.small, b.small, t)!,
      muted: TextStyle.lerp(a.muted, b.muted, t)!,
      family: b.family,
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
    return other is ShadTextTheme &&
        other.h1Large == h1Large &&
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
        other.muted == muted &&
        other.family == family;
  }

  @override
  int get hashCode {
    return Object.hash(
      h1Large,
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
      family,
      merge,
    );
  }
}
