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
      tabSelectedShadows:
          t < 0.5 ? a?.tabSelectedShadows : b?.tabSelectedShadows,
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
      tabHoverTextDecoration:
          t < 0.5 ? a?.tabHoverTextDecoration : b?.tabHoverTextDecoration,
      tabMainAxisAlignment:
          t < 0.5 ? a?.tabMainAxisAlignment : b?.tabMainAxisAlignment,
      tabCrossAxisAlignment:
          t < 0.5 ? a?.tabCrossAxisAlignment : b?.tabCrossAxisAlignment,
      tabHoverStrategies:
          t < 0.5 ? a?.tabHoverStrategies : b?.tabHoverStrategies,
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
    final _this = (this as ShadTabsTheme);

    return ShadTabsTheme(
      gap: gap ?? _this.gap,
      tabsGap: tabsGap ?? _this.tabsGap,
      tabBarAlignment: tabBarAlignment ?? _this.tabBarAlignment,
      dragStartBehavior: dragStartBehavior ?? _this.dragStartBehavior,
      physics: physics ?? _this.physics,
      padding: padding ?? _this.padding,
      decoration: decoration ?? _this.decoration,
      tabBarConstraints: tabBarConstraints ?? _this.tabBarConstraints,
      contentConstraints: contentConstraints ?? _this.contentConstraints,
      expandContent: expandContent ?? _this.expandContent,
      tabWidth: tabWidth ?? _this.tabWidth,
      tabBackgroundColor: tabBackgroundColor ?? _this.tabBackgroundColor,
      tabSelectedBackgroundColor:
          tabSelectedBackgroundColor ?? _this.tabSelectedBackgroundColor,
      tabHoverBackgroundColor:
          tabHoverBackgroundColor ?? _this.tabHoverBackgroundColor,
      tabSelectedHoverBackgroundColor: tabSelectedHoverBackgroundColor ??
          _this.tabSelectedHoverBackgroundColor,
      tabPadding: tabPadding ?? _this.tabPadding,
      tabDecoration: tabDecoration ?? _this.tabDecoration,
      tabSelectedDecoration:
          tabSelectedDecoration ?? _this.tabSelectedDecoration,
      tabForegroundColor: tabForegroundColor ?? _this.tabForegroundColor,
      tabSelectedForegroundColor:
          tabSelectedForegroundColor ?? _this.tabSelectedForegroundColor,
      tabTextStyle: tabTextStyle ?? _this.tabTextStyle,
      tabShadows: tabShadows ?? _this.tabShadows,
      tabSelectedShadows: tabSelectedShadows ?? _this.tabSelectedShadows,
      tabSize: tabSize ?? _this.tabSize,
      tabCursor: tabCursor ?? _this.tabCursor,
      tabHoverForegroundColor:
          tabHoverForegroundColor ?? _this.tabHoverForegroundColor,
      tabPressedBackgroundColor:
          tabPressedBackgroundColor ?? _this.tabPressedBackgroundColor,
      tabPressedForegroundColor:
          tabPressedForegroundColor ?? _this.tabPressedForegroundColor,
      tabGradient: tabGradient ?? _this.tabGradient,
      tabTextDecoration: tabTextDecoration ?? _this.tabTextDecoration,
      tabHoverTextDecoration:
          tabHoverTextDecoration ?? _this.tabHoverTextDecoration,
      tabMainAxisAlignment: tabMainAxisAlignment ?? _this.tabMainAxisAlignment,
      tabCrossAxisAlignment:
          tabCrossAxisAlignment ?? _this.tabCrossAxisAlignment,
      tabHoverStrategies: tabHoverStrategies ?? _this.tabHoverStrategies,
      longPressDuration: longPressDuration ?? _this.longPressDuration,
    );
  }

  ShadTabsTheme merge(ShadTabsTheme? other) {
    final _this = (this as ShadTabsTheme);

    if (other == null) {
      return _this;
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
      decoration: other.decoration,
      tabBarConstraints: other.tabBarConstraints,
      contentConstraints: other.contentConstraints,
      expandContent: other.expandContent,
      tabWidth: other.tabWidth,
      tabBackgroundColor: other.tabBackgroundColor,
      tabSelectedBackgroundColor: other.tabSelectedBackgroundColor,
      tabHoverBackgroundColor: other.tabHoverBackgroundColor,
      tabSelectedHoverBackgroundColor: other.tabSelectedHoverBackgroundColor,
      tabPadding: other.tabPadding,
      tabDecoration: other.tabDecoration,
      tabSelectedDecoration: other.tabSelectedDecoration,
      tabForegroundColor: other.tabForegroundColor,
      tabSelectedForegroundColor: other.tabSelectedForegroundColor,
      tabTextStyle:
          _this.tabTextStyle?.merge(other.tabTextStyle) ?? other.tabTextStyle,
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadTabsTheme);
    final _other = (other as ShadTabsTheme);

    return _other.gap == _this.gap &&
        _other.tabsGap == _this.tabsGap &&
        _other.tabBarAlignment == _this.tabBarAlignment &&
        _other.dragStartBehavior == _this.dragStartBehavior &&
        _other.physics == _this.physics &&
        _other.padding == _this.padding &&
        _other.decoration == _this.decoration &&
        _other.tabBarConstraints == _this.tabBarConstraints &&
        _other.contentConstraints == _this.contentConstraints &&
        _other.expandContent == _this.expandContent &&
        _other.tabWidth == _this.tabWidth &&
        _other.tabBackgroundColor == _this.tabBackgroundColor &&
        _other.tabSelectedBackgroundColor == _this.tabSelectedBackgroundColor &&
        _other.tabHoverBackgroundColor == _this.tabHoverBackgroundColor &&
        _other.tabSelectedHoverBackgroundColor ==
            _this.tabSelectedHoverBackgroundColor &&
        _other.tabPadding == _this.tabPadding &&
        _other.tabDecoration == _this.tabDecoration &&
        _other.tabSelectedDecoration == _this.tabSelectedDecoration &&
        _other.tabForegroundColor == _this.tabForegroundColor &&
        _other.tabSelectedForegroundColor == _this.tabSelectedForegroundColor &&
        _other.tabTextStyle == _this.tabTextStyle &&
        _other.tabShadows == _this.tabShadows &&
        _other.tabSelectedShadows == _this.tabSelectedShadows &&
        _other.tabSize == _this.tabSize &&
        _other.tabCursor == _this.tabCursor &&
        _other.tabHoverForegroundColor == _this.tabHoverForegroundColor &&
        _other.tabPressedBackgroundColor == _this.tabPressedBackgroundColor &&
        _other.tabPressedForegroundColor == _this.tabPressedForegroundColor &&
        _other.tabGradient == _this.tabGradient &&
        _other.tabTextDecoration == _this.tabTextDecoration &&
        _other.tabHoverTextDecoration == _this.tabHoverTextDecoration &&
        _other.tabMainAxisAlignment == _this.tabMainAxisAlignment &&
        _other.tabCrossAxisAlignment == _this.tabCrossAxisAlignment &&
        _other.tabHoverStrategies == _this.tabHoverStrategies &&
        _other.longPressDuration == _this.longPressDuration;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTabsTheme);

    return Object.hashAll([
      runtimeType,
      _this.gap,
      _this.tabsGap,
      _this.tabBarAlignment,
      _this.dragStartBehavior,
      _this.physics,
      _this.padding,
      _this.decoration,
      _this.tabBarConstraints,
      _this.contentConstraints,
      _this.expandContent,
      _this.tabWidth,
      _this.tabBackgroundColor,
      _this.tabSelectedBackgroundColor,
      _this.tabHoverBackgroundColor,
      _this.tabSelectedHoverBackgroundColor,
      _this.tabPadding,
      _this.tabDecoration,
      _this.tabSelectedDecoration,
      _this.tabForegroundColor,
      _this.tabSelectedForegroundColor,
      _this.tabTextStyle,
      _this.tabShadows,
      _this.tabSelectedShadows,
      _this.tabSize,
      _this.tabCursor,
      _this.tabHoverForegroundColor,
      _this.tabPressedBackgroundColor,
      _this.tabPressedForegroundColor,
      _this.tabGradient,
      _this.tabTextDecoration,
      _this.tabHoverTextDecoration,
      _this.tabMainAxisAlignment,
      _this.tabCrossAxisAlignment,
      _this.tabHoverStrategies,
      _this.longPressDuration,
    ]);
  }
}
