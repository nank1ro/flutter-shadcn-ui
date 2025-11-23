// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'tabs.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTabsTheme {
  bool get canMerge => true;

  static ShadTabsTheme? lerp(ShadTabsTheme? a, ShadTabsTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadTabsTheme(
      gap: lerpDouble$(a?.gap, b?.gap, t),
      tabsGap: lerpDouble$(a?.tabsGap, b?.tabsGap, t),
      tabBarAlignment: Alignment.lerp(
        a?.tabBarAlignment,
        b?.tabBarAlignment,
        t,
      ),
      dragStartBehavior: t < 0.5 ? a?.dragStartBehavior : b?.dragStartBehavior,
      physics: t < 0.5 ? a?.physics : b?.physics,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      tabBarConstraints: BoxConstraints.lerp(
        a?.tabBarConstraints,
        b?.tabBarConstraints,
        t,
      ),
      contentConstraints: BoxConstraints.lerp(
        a?.contentConstraints,
        b?.contentConstraints,
        t,
      ),
      expandContent: t < 0.5 ? a?.expandContent : b?.expandContent,
      tabWidth: lerpDouble$(a?.tabWidth, b?.tabWidth, t),
      tabBackgroundColor: Color.lerp(
        a?.tabBackgroundColor,
        b?.tabBackgroundColor,
        t,
      ),
      tabSelectedBackgroundColor: Color.lerp(
        a?.tabSelectedBackgroundColor,
        b?.tabSelectedBackgroundColor,
        t,
      ),
      tabHoverBackgroundColor: Color.lerp(
        a?.tabHoverBackgroundColor,
        b?.tabHoverBackgroundColor,
        t,
      ),
      tabSelectedHoverBackgroundColor: Color.lerp(
        a?.tabSelectedHoverBackgroundColor,
        b?.tabSelectedHoverBackgroundColor,
        t,
      ),
      tabPadding: EdgeInsetsGeometry.lerp(a?.tabPadding, b?.tabPadding, t),
      tabDecoration: ShadDecoration.lerp(a?.tabDecoration, b?.tabDecoration, t),
      tabSelectedDecoration: ShadDecoration.lerp(
        a?.tabSelectedDecoration,
        b?.tabSelectedDecoration,
        t,
      ),
      tabForegroundColor: Color.lerp(
        a?.tabForegroundColor,
        b?.tabForegroundColor,
        t,
      ),
      tabSelectedForegroundColor: Color.lerp(
        a?.tabSelectedForegroundColor,
        b?.tabSelectedForegroundColor,
        t,
      ),
      tabTextStyle: TextStyle.lerp(a?.tabTextStyle, b?.tabTextStyle, t),
      tabShadows: t < 0.5 ? a?.tabShadows : b?.tabShadows,
      tabSelectedShadows: t < 0.5
          ? a?.tabSelectedShadows
          : b?.tabSelectedShadows,
      tabSize: t < 0.5 ? a?.tabSize : b?.tabSize,
      tabCursor: t < 0.5 ? a?.tabCursor : b?.tabCursor,
      tabHoverForegroundColor: Color.lerp(
        a?.tabHoverForegroundColor,
        b?.tabHoverForegroundColor,
        t,
      ),
      tabPressedBackgroundColor: Color.lerp(
        a?.tabPressedBackgroundColor,
        b?.tabPressedBackgroundColor,
        t,
      ),
      tabPressedForegroundColor: Color.lerp(
        a?.tabPressedForegroundColor,
        b?.tabPressedForegroundColor,
        t,
      ),
      tabGradient: Gradient.lerp(a?.tabGradient, b?.tabGradient, t),
      tabTextDecoration: t < 0.5 ? a?.tabTextDecoration : b?.tabTextDecoration,
      tabHoverTextDecoration: t < 0.5
          ? a?.tabHoverTextDecoration
          : b?.tabHoverTextDecoration,
      tabMainAxisAlignment: t < 0.5
          ? a?.tabMainAxisAlignment
          : b?.tabMainAxisAlignment,
      tabCrossAxisAlignment: t < 0.5
          ? a?.tabCrossAxisAlignment
          : b?.tabCrossAxisAlignment,
      tabHoverStrategies: t < 0.5
          ? a?.tabHoverStrategies
          : b?.tabHoverStrategies,
      longPressDuration: lerpDuration$(
        a?.longPressDuration,
        b?.longPressDuration,
        t,
      ),
    );
  }

  ShadTabsTheme copyWith({
    double? gap,
    double? tabsGap,
    Alignment? tabBarAlignment,
    DragStartBehavior? dragStartBehavior,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    BoxConstraints? tabBarConstraints,
    BoxConstraints? contentConstraints,
    bool? expandContent,
    double? tabWidth,
    Color? tabBackgroundColor,
    Color? tabSelectedBackgroundColor,
    Color? tabHoverBackgroundColor,
    Color? tabSelectedHoverBackgroundColor,
    EdgeInsetsGeometry? tabPadding,
    ShadDecoration? tabDecoration,
    ShadDecoration? tabSelectedDecoration,
    Color? tabForegroundColor,
    Color? tabSelectedForegroundColor,
    TextStyle? tabTextStyle,
    List<BoxShadow>? tabShadows,
    List<BoxShadow>? tabSelectedShadows,
    ShadButtonSize? tabSize,
    MouseCursor? tabCursor,
    Color? tabHoverForegroundColor,
    Color? tabPressedBackgroundColor,
    Color? tabPressedForegroundColor,
    Gradient? tabGradient,
    TextDecoration? tabTextDecoration,
    TextDecoration? tabHoverTextDecoration,
    MainAxisAlignment? tabMainAxisAlignment,
    CrossAxisAlignment? tabCrossAxisAlignment,
    ShadHoverStrategies? tabHoverStrategies,
    Duration? longPressDuration,
  }) {
    final a = (this as ShadTabsTheme);

    return ShadTabsTheme(
      gap: gap ?? a.gap,
      tabsGap: tabsGap ?? a.tabsGap,
      tabBarAlignment: tabBarAlignment ?? a.tabBarAlignment,
      dragStartBehavior: dragStartBehavior ?? a.dragStartBehavior,
      physics: physics ?? a.physics,
      padding: padding ?? a.padding,
      decoration: decoration ?? a.decoration,
      tabBarConstraints: tabBarConstraints ?? a.tabBarConstraints,
      contentConstraints: contentConstraints ?? a.contentConstraints,
      expandContent: expandContent ?? a.expandContent,
      tabWidth: tabWidth ?? a.tabWidth,
      tabBackgroundColor: tabBackgroundColor ?? a.tabBackgroundColor,
      tabSelectedBackgroundColor:
          tabSelectedBackgroundColor ?? a.tabSelectedBackgroundColor,
      tabHoverBackgroundColor:
          tabHoverBackgroundColor ?? a.tabHoverBackgroundColor,
      tabSelectedHoverBackgroundColor:
          tabSelectedHoverBackgroundColor ?? a.tabSelectedHoverBackgroundColor,
      tabPadding: tabPadding ?? a.tabPadding,
      tabDecoration: tabDecoration ?? a.tabDecoration,
      tabSelectedDecoration: tabSelectedDecoration ?? a.tabSelectedDecoration,
      tabForegroundColor: tabForegroundColor ?? a.tabForegroundColor,
      tabSelectedForegroundColor:
          tabSelectedForegroundColor ?? a.tabSelectedForegroundColor,
      tabTextStyle: tabTextStyle ?? a.tabTextStyle,
      tabShadows: tabShadows ?? a.tabShadows,
      tabSelectedShadows: tabSelectedShadows ?? a.tabSelectedShadows,
      tabSize: tabSize ?? a.tabSize,
      tabCursor: tabCursor ?? a.tabCursor,
      tabHoverForegroundColor:
          tabHoverForegroundColor ?? a.tabHoverForegroundColor,
      tabPressedBackgroundColor:
          tabPressedBackgroundColor ?? a.tabPressedBackgroundColor,
      tabPressedForegroundColor:
          tabPressedForegroundColor ?? a.tabPressedForegroundColor,
      tabGradient: tabGradient ?? a.tabGradient,
      tabTextDecoration: tabTextDecoration ?? a.tabTextDecoration,
      tabHoverTextDecoration:
          tabHoverTextDecoration ?? a.tabHoverTextDecoration,
      tabMainAxisAlignment: tabMainAxisAlignment ?? a.tabMainAxisAlignment,
      tabCrossAxisAlignment: tabCrossAxisAlignment ?? a.tabCrossAxisAlignment,
      tabHoverStrategies: tabHoverStrategies ?? a.tabHoverStrategies,
      longPressDuration: longPressDuration ?? a.longPressDuration,
    );
  }

  ShadTabsTheme merge(ShadTabsTheme? other) {
    final current = (this as ShadTabsTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      gap: other.gap,
      tabsGap: other.tabsGap,
      tabBarAlignment: other.tabBarAlignment,
      dragStartBehavior: other.dragStartBehavior,
      physics: other.physics,
      padding: other.padding,
      decoration:
          current.decoration?.merge(other.decoration) ?? other.decoration,
      tabBarConstraints: other.tabBarConstraints,
      contentConstraints: other.contentConstraints,
      expandContent: other.expandContent,
      tabWidth: other.tabWidth,
      tabBackgroundColor: other.tabBackgroundColor,
      tabSelectedBackgroundColor: other.tabSelectedBackgroundColor,
      tabHoverBackgroundColor: other.tabHoverBackgroundColor,
      tabSelectedHoverBackgroundColor: other.tabSelectedHoverBackgroundColor,
      tabPadding: other.tabPadding,
      tabDecoration:
          current.tabDecoration?.merge(other.tabDecoration) ??
          other.tabDecoration,
      tabSelectedDecoration:
          current.tabSelectedDecoration?.merge(other.tabSelectedDecoration) ??
          other.tabSelectedDecoration,
      tabForegroundColor: other.tabForegroundColor,
      tabSelectedForegroundColor: other.tabSelectedForegroundColor,
      tabTextStyle:
          current.tabTextStyle?.merge(other.tabTextStyle) ?? other.tabTextStyle,
      tabShadows: other.tabShadows,
      tabSelectedShadows: other.tabSelectedShadows,
      tabSize: other.tabSize,
      tabCursor: other.tabCursor,
      tabHoverForegroundColor: other.tabHoverForegroundColor,
      tabPressedBackgroundColor: other.tabPressedBackgroundColor,
      tabPressedForegroundColor: other.tabPressedForegroundColor,
      tabGradient: other.tabGradient,
      tabTextDecoration: other.tabTextDecoration,
      tabHoverTextDecoration: other.tabHoverTextDecoration,
      tabMainAxisAlignment: other.tabMainAxisAlignment,
      tabCrossAxisAlignment: other.tabCrossAxisAlignment,
      tabHoverStrategies: other.tabHoverStrategies,
      longPressDuration: other.longPressDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadTabsTheme) {
      return false;
    }

    final value = (this as ShadTabsTheme);

    return other.gap == value.gap &&
        other.tabsGap == value.tabsGap &&
        other.tabBarAlignment == value.tabBarAlignment &&
        other.dragStartBehavior == value.dragStartBehavior &&
        other.physics == value.physics &&
        other.padding == value.padding &&
        other.decoration == value.decoration &&
        other.tabBarConstraints == value.tabBarConstraints &&
        other.contentConstraints == value.contentConstraints &&
        other.expandContent == value.expandContent &&
        other.tabWidth == value.tabWidth &&
        other.tabBackgroundColor == value.tabBackgroundColor &&
        other.tabSelectedBackgroundColor == value.tabSelectedBackgroundColor &&
        other.tabHoverBackgroundColor == value.tabHoverBackgroundColor &&
        other.tabSelectedHoverBackgroundColor ==
            value.tabSelectedHoverBackgroundColor &&
        other.tabPadding == value.tabPadding &&
        other.tabDecoration == value.tabDecoration &&
        other.tabSelectedDecoration == value.tabSelectedDecoration &&
        other.tabForegroundColor == value.tabForegroundColor &&
        other.tabSelectedForegroundColor == value.tabSelectedForegroundColor &&
        other.tabTextStyle == value.tabTextStyle &&
        other.tabShadows == value.tabShadows &&
        other.tabSelectedShadows == value.tabSelectedShadows &&
        other.tabSize == value.tabSize &&
        other.tabCursor == value.tabCursor &&
        other.tabHoverForegroundColor == value.tabHoverForegroundColor &&
        other.tabPressedBackgroundColor == value.tabPressedBackgroundColor &&
        other.tabPressedForegroundColor == value.tabPressedForegroundColor &&
        other.tabGradient == value.tabGradient &&
        other.tabTextDecoration == value.tabTextDecoration &&
        other.tabHoverTextDecoration == value.tabHoverTextDecoration &&
        other.tabMainAxisAlignment == value.tabMainAxisAlignment &&
        other.tabCrossAxisAlignment == value.tabCrossAxisAlignment &&
        other.tabHoverStrategies == value.tabHoverStrategies &&
        other.longPressDuration == value.longPressDuration;
  }

  @override
  int get hashCode {
    final value = (this as ShadTabsTheme);

    return Object.hashAll([
      runtimeType,
      value.gap,
      value.tabsGap,
      value.tabBarAlignment,
      value.dragStartBehavior,
      value.physics,
      value.padding,
      value.decoration,
      value.tabBarConstraints,
      value.contentConstraints,
      value.expandContent,
      value.tabWidth,
      value.tabBackgroundColor,
      value.tabSelectedBackgroundColor,
      value.tabHoverBackgroundColor,
      value.tabSelectedHoverBackgroundColor,
      value.tabPadding,
      value.tabDecoration,
      value.tabSelectedDecoration,
      value.tabForegroundColor,
      value.tabSelectedForegroundColor,
      value.tabTextStyle,
      value.tabShadows,
      value.tabSelectedShadows,
      value.tabSize,
      value.tabCursor,
      value.tabHoverForegroundColor,
      value.tabPressedBackgroundColor,
      value.tabPressedForegroundColor,
      value.tabGradient,
      value.tabTextDecoration,
      value.tabHoverTextDecoration,
      value.tabMainAxisAlignment,
      value.tabCrossAxisAlignment,
      value.tabHoverStrategies,
      value.longPressDuration,
    ]);
  }
}
