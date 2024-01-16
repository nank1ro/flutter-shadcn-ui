import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';

typedef ShadcnButtonSizePropertyResolver<T> = T Function(ShadcnButtonSize size);

abstract class ShadcnButtonSizeProperty<T> {
  T resolve(ShadcnButtonSize size);
  static T resolveAs<T>(T value, ShadcnButtonSize size) {
    if (value is ShadcnButtonSizeProperty<T>) {
      final ShadcnButtonSizeProperty<T> property = value;
      return property.resolve(size);
    }
    return value;
  }

  static ShadcnButtonSizeProperty<T> resolveWith<T>(
    ShadcnButtonSizePropertyResolver<T> callback,
  ) =>
      _ShadcnButtonSizePropertyWith<T>(callback);

  static ShadcnButtonSizeProperty<T> all<T>(T value) =>
      ShadcnButtonSizePropertyAll<T>(value);

  /// Linearly interpolate between two [ShadcnButtonSizeProperty]s.
  static ShadcnButtonSizeProperty<T?>? lerp<T>(
    ShadcnButtonSizeProperty<T>? a,
    ShadcnButtonSizeProperty<T>? b,
    double t,
    T? Function(T?, T?, double) lerpFunction,
  ) {
    // Avoid creating a _LerpProperties object for a common case.
    if (a == null && b == null) {
      return null;
    }
    return _LerpProperties<T>(a, b, t, lerpFunction);
  }
}

class _LerpProperties<T> implements ShadcnButtonSizeProperty<T?> {
  const _LerpProperties(this.a, this.b, this.t, this.lerpFunction);

  final ShadcnButtonSizeProperty<T>? a;
  final ShadcnButtonSizeProperty<T>? b;
  final double t;
  final T? Function(T?, T?, double) lerpFunction;

  @override
  T? resolve(ShadcnButtonSize size) {
    final resolvedA = a?.resolve(size);
    final resolvedB = b?.resolve(size);
    return lerpFunction(resolvedA, resolvedB, t);
  }
}

class _ShadcnButtonSizePropertyWith<T> implements ShadcnButtonSizeProperty<T> {
  _ShadcnButtonSizePropertyWith(this._resolve);

  final ShadcnButtonSizePropertyResolver<T> _resolve;

  @override
  T resolve(ShadcnButtonSize size) => _resolve(size);
}

class ShadcnButtonSizePropertyAll<T> implements ShadcnButtonSizeProperty<T> {
  const ShadcnButtonSizePropertyAll(this.value);
  final T value;

  @override
  T resolve(ShadcnButtonSize size) => value;

  @override
  String toString() {
    if (value is double) {
      return 'ShadcnButtonSizePropertyAll(${debugFormatDouble(value as double)})';
    } else {
      return 'ShadcnButtonSizePropertyAll($value)';
    }
  }
}

class DefaultWidth implements ShadcnButtonSizeProperty<double?> {
  const DefaultWidth();
  @override
  double? resolve(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.icon => 40,
      _ => null,
    };
  }
}

class DefaultHeight implements ShadcnButtonSizeProperty<double?> {
  const DefaultHeight();
  @override
  double? resolve(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.$default => 40,
      ShadcnButtonSize.sm => 36,
      ShadcnButtonSize.lg => 44,
      ShadcnButtonSize.icon => 40,
    };
  }
}

class DefaultPadding implements ShadcnButtonSizeProperty<EdgeInsets?> {
  const DefaultPadding();
  @override
  EdgeInsets? resolve(ShadcnButtonSize size) {
    return switch (size) {
      ShadcnButtonSize.$default =>
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ShadcnButtonSize.sm => const EdgeInsets.symmetric(horizontal: 12),
      ShadcnButtonSize.lg =>
        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ShadcnButtonSize.icon => EdgeInsets.zero,
    };
  }
}

/// The theme for ShadcnButton.
///
/// Use this class to override some properties to all buttons in just one place.
@immutable
class ShadcnButtonTheme {
  const ShadcnButtonTheme({
    this.merge = true,
    this.applyIconColorFilter = true,
    this.cursor,
    this.size = ShadcnButtonSize.$default,
    this.width = const DefaultWidth(),
    this.height = const DefaultHeight(),
    this.padding = const DefaultPadding(),
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.radius,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.focusBuilder,
  });
  final bool merge;
  final bool applyIconColorFilter;
  final MouseCursor? cursor;
  final ShadcnButtonSize? size;
  final ShadcnButtonSizeProperty<double?>? width;
  final ShadcnButtonSizeProperty<double?>? height;
  final ShadcnButtonSizeProperty<EdgeInsets?>? padding;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final BoxBorder? border;
  final BorderRadius? radius;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final FocusWidgetBuilder? focusBuilder;

  static ShadcnButtonTheme lerp(
    ShadcnButtonTheme a,
    ShadcnButtonTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnButtonTheme(
      applyIconColorFilter: b.applyIconColorFilter,
      width: ShadcnButtonSizeProperty.lerp<double?>(
        a.width,
        b.width,
        t,
        lerpDouble,
      ),
      height: ShadcnButtonSizeProperty.lerp<double?>(
        a.height,
        b.height,
        t,
        lerpDouble,
      ),
      padding: ShadcnButtonSizeProperty.lerp<EdgeInsets?>(
        a.padding,
        b.padding,
        t,
        EdgeInsets.lerp,
      ),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      hoverForegroundColor:
          Color.lerp(a.hoverForegroundColor, b.hoverForegroundColor, t),
      border: b.border,
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      pressedBackgroundColor:
          Color.lerp(a.pressedBackgroundColor, b.pressedBackgroundColor, t),
      pressedForegroundColor:
          Color.lerp(a.pressedForegroundColor, b.pressedForegroundColor, t),
      shadows: b.shadows,
      gradient: b.gradient,
      textDecoration: b.textDecoration,
      hoverTextDecoration: b.hoverTextDecoration,
      cursor: b.cursor,
      focusBuilder: b.focusBuilder,
      size: b.size,
    );
  }

  ShadcnButtonTheme copyWith({
    bool? applyIconColorFilter,
    MouseCursor? cursor,
    MouseCursor? disabledCursor,
    ShadcnButtonSize? size,
    ShadcnButtonSizeProperty<double?>? width,
    ShadcnButtonSizeProperty<double?>? height,
    ShadcnButtonSizeProperty<EdgeInsets?>? padding,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    BoxBorder? border,
    BorderRadius? radius,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    TextDecoration? textDecoration,
    TextDecoration? hoverTextDecoration,
    FocusWidgetBuilder? focusBuilder,
  }) {
    return ShadcnButtonTheme(
      applyIconColorFilter: applyIconColorFilter ?? this.applyIconColorFilter,
      cursor: cursor ?? this.cursor,
      size: size ?? this.size,
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      textDecoration: textDecoration ?? this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? this.hoverTextDecoration,
      focusBuilder: focusBuilder ?? this.focusBuilder,
    );
  }

  ShadcnButtonTheme mergeWith(ShadcnButtonTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      applyIconColorFilter: other.applyIconColorFilter,
      cursor: other.cursor,
      size: other.size,
      width: other.width,
      height: other.height,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      hoverForegroundColor: other.hoverForegroundColor,
      border: other.border,
      radius: other.radius,
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      shadows: other.shadows,
      gradient: other.gradient,
      textDecoration: other.textDecoration,
      hoverTextDecoration: other.hoverTextDecoration,
      focusBuilder: other.focusBuilder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnButtonTheme &&
        other.applyIconColorFilter == applyIconColorFilter &&
        other.cursor == cursor &&
        other.size == size &&
        other.width == width &&
        other.height == height &&
        other.padding == padding &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.hoverForegroundColor == hoverForegroundColor &&
        other.border == border &&
        other.radius == radius &&
        other.pressedBackgroundColor == pressedBackgroundColor &&
        other.pressedForegroundColor == pressedForegroundColor &&
        listEquals(other.shadows, shadows) &&
        other.gradient == gradient &&
        other.textDecoration == textDecoration &&
        other.hoverTextDecoration == hoverTextDecoration &&
        other.focusBuilder == focusBuilder;
  }

  @override
  int get hashCode {
    return applyIconColorFilter.hashCode ^
        cursor.hashCode ^
        size.hashCode ^
        width.hashCode ^
        height.hashCode ^
        padding.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode ^
        hoverForegroundColor.hashCode ^
        border.hashCode ^
        radius.hashCode ^
        pressedBackgroundColor.hashCode ^
        pressedForegroundColor.hashCode ^
        shadows.hashCode ^
        gradient.hashCode ^
        textDecoration.hashCode ^
        hoverTextDecoration.hashCode ^
        focusBuilder.hashCode;
  }
}
