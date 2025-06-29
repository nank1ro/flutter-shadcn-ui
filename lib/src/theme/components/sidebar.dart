import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Theme for [ShadSidebar] components.
@immutable
class ShadSidebarTheme {
  const ShadSidebarTheme({
    this.merge = true,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.animationDuration,
    this.animationCurve,
    this.groupSpacing,
  });

  final bool merge;

  /// {@macro ShadSidebar.width}
  final double? width;

  /// {@macro ShadSidebar.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadSidebar.borderColor}
  final Color? borderColor;

  /// {@macro ShadSidebar.padding}
  final EdgeInsetsGeometry? padding;

  /// Duration for collapse/expand animations.
  final Duration? animationDuration;

  /// Curve for collapse/expand animations.
  final Curve? animationCurve;

  /// Spacing between navigation groups.
  final double? groupSpacing;

  static ShadSidebarTheme lerp(
    ShadSidebarTheme? a,
    ShadSidebarTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a ?? const ShadSidebarTheme();
    return ShadSidebarTheme(
      merge: b?.merge ?? a?.merge ?? true,
      width: lerpDouble(a?.width, b?.width, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      animationDuration: b?.animationDuration ?? a?.animationDuration,
      animationCurve: b?.animationCurve ?? a?.animationCurve,
      groupSpacing: lerpDouble(a?.groupSpacing, b?.groupSpacing, t),
    );
  }

  ShadSidebarTheme mergeWith(ShadSidebarTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      width: other.width,
      backgroundColor: other.backgroundColor,
      borderColor: other.borderColor,
      padding: other.padding,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
      groupSpacing: other.groupSpacing,
    );
  }

  ShadSidebarTheme copyWith({
    bool? merge,
    double? width,
    Color? backgroundColor,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
    Duration? animationDuration,
    Curve? animationCurve,
    double? groupSpacing,
  }) {
    return ShadSidebarTheme(
      merge: merge ?? this.merge,
      width: width ?? this.width,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      padding: padding ?? this.padding,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      groupSpacing: groupSpacing ?? this.groupSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadSidebarTheme &&
        other.merge == merge &&
        other.width == width &&
        other.backgroundColor == backgroundColor &&
        other.borderColor == borderColor &&
        other.padding == padding &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.groupSpacing == groupSpacing;
  }

  @override
  int get hashCode {
    return Object.hash(
      merge,
      width,
      backgroundColor,
      borderColor,
      padding,
      animationDuration,
      animationCurve,
      groupSpacing,
    );
  }
}

/// Theme for [ShadSidebarGroup] components.
@immutable
class ShadSidebarGroupTheme {
  const ShadSidebarGroupTheme({
    this.merge = true,
    this.labelStyle,
    this.spacing,
    this.padding,
  });

  final bool merge;

  /// Text style for group labels.
  final TextStyle? labelStyle;

  /// Spacing between groups.
  final double? spacing;

  /// Padding for group content.
  final EdgeInsetsGeometry? padding;

  static ShadSidebarGroupTheme lerp(
    ShadSidebarGroupTheme? a,
    ShadSidebarGroupTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a ?? const ShadSidebarGroupTheme();
    return ShadSidebarGroupTheme(
      merge: b?.merge ?? a?.merge ?? true,
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  ShadSidebarGroupTheme mergeWith(ShadSidebarGroupTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      labelStyle: other.labelStyle,
      spacing: other.spacing,
      padding: other.padding,
    );
  }

  ShadSidebarGroupTheme copyWith({
    bool? merge,
    TextStyle? labelStyle,
    double? spacing,
    EdgeInsetsGeometry? padding,
  }) {
    return ShadSidebarGroupTheme(
      merge: merge ?? this.merge,
      labelStyle: labelStyle ?? this.labelStyle,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadSidebarGroupTheme &&
        other.merge == merge &&
        other.labelStyle == labelStyle &&
        other.spacing == spacing &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return Object.hash(merge, labelStyle, spacing, padding);
  }
}

/// Theme for [ShadSidebarMenuItem] components.
@immutable
class ShadSidebarMenuItemTheme {
  const ShadSidebarMenuItemTheme({
    this.merge = true,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.activeTextStyle,
    this.activeBackgroundColor,
    this.hoverBackgroundColor,
    this.iconSize,
    this.chevronSize,
    this.animationDuration,
  });

  final bool merge;

  /// Padding for menu items.
  final EdgeInsetsGeometry? padding;

  /// Border radius for menu items.
  final BorderRadius? borderRadius;

  /// Text style for menu items.
  final TextStyle? textStyle;

  /// Text style for active menu items.
  final TextStyle? activeTextStyle;

  /// Background color for active menu items.
  final Color? activeBackgroundColor;

  /// Background color for hovered menu items.
  final Color? hoverBackgroundColor;

  /// Size for menu item icons.
  final double? iconSize;

  /// Size for chevron icons.
  final double? chevronSize;

  /// Duration for hover animations.
  final Duration? animationDuration;

  static ShadSidebarMenuItemTheme lerp(
    ShadSidebarMenuItemTheme? a,
    ShadSidebarMenuItemTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a ?? const ShadSidebarMenuItemTheme();
    return ShadSidebarMenuItemTheme(
      merge: b?.merge ?? a?.merge ?? true,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      activeTextStyle: TextStyle.lerp(a?.activeTextStyle, b?.activeTextStyle, t),
      activeBackgroundColor: Color.lerp(a?.activeBackgroundColor, b?.activeBackgroundColor, t),
      hoverBackgroundColor: Color.lerp(a?.hoverBackgroundColor, b?.hoverBackgroundColor, t),
      iconSize: lerpDouble(a?.iconSize, b?.iconSize, t),
      chevronSize: lerpDouble(a?.chevronSize, b?.chevronSize, t),
      animationDuration: b?.animationDuration ?? a?.animationDuration,
    );
  }

  ShadSidebarMenuItemTheme mergeWith(ShadSidebarMenuItemTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      padding: other.padding,
      borderRadius: other.borderRadius,
      textStyle: other.textStyle,
      activeTextStyle: other.activeTextStyle,
      activeBackgroundColor: other.activeBackgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      iconSize: other.iconSize,
      chevronSize: other.chevronSize,
      animationDuration: other.animationDuration,
    );
  }

  ShadSidebarMenuItemTheme copyWith({
    bool? merge,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    TextStyle? activeTextStyle,
    Color? activeBackgroundColor,
    Color? hoverBackgroundColor,
    double? iconSize,
    double? chevronSize,
    Duration? animationDuration,
  }) {
    return ShadSidebarMenuItemTheme(
      merge: merge ?? this.merge,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      iconSize: iconSize ?? this.iconSize,
      chevronSize: chevronSize ?? this.chevronSize,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadSidebarMenuItemTheme &&
        other.merge == merge &&
        other.padding == padding &&
        other.borderRadius == borderRadius &&
        other.textStyle == textStyle &&
        other.activeTextStyle == activeTextStyle &&
        other.activeBackgroundColor == activeBackgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.iconSize == iconSize &&
        other.chevronSize == chevronSize &&
        other.animationDuration == animationDuration;
  }

  @override
  int get hashCode {
    return Object.hash(
      merge,
      padding,
      borderRadius,
      textStyle,
      activeTextStyle,
      activeBackgroundColor,
      hoverBackgroundColor,
      iconSize,
      chevronSize,
      animationDuration,
    );
  }
}
