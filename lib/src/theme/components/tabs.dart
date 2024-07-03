import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

@immutable
class ShadTabsTheme {
  const ShadTabsTheme({
    this.merge = true,
    this.gap,
    this.dragStartBehavior,
    this.physics,
    this.padding,
    this.decoration,
    this.tabBarConstraints,
    this.contentConstraints,
    this.expandContent,
    this.tabWidth,
    this.tabBackgroundColor,
    this.tabSelectedBackgroundColor,
    this.tabHoverBackgroundColor,
    this.tabSelectedHoverBackgroundColor,
    this.tabPadding,
    this.tabDecoration,
    this.tabSelectedDecoration,
    this.tabForegroundColor,
    this.tabSelectedForegroundColor,
    this.tabTextStyle,
    this.tabShadows,
    this.tabSelectedShadows,
    this.tabSize,
    this.tabApplyIconColorFilter,
    this.tabCursor,
    this.tabHoverForegroundColor,
    this.tabPressedBackgroundColor,
    this.tabPressedForegroundColor,
    this.tabGradient,
    this.tabTextDecoration,
    this.tabHoverTextDecoration,
    this.tabMainAxisAlignment,
    this.tabCrossAxisAlignment,
    this.tabHoverStrategies,
    this.longPressDuration,
  });

  final bool merge;

  /// {@macro ShadTabsTheme.gap}
  final double? gap;

  /// {@macro ShadTabs.dragStartBehavior}
  final DragStartBehavior? dragStartBehavior;

  /// {@macro ShadTabs.physics}
  final ScrollPhysics? physics;

  /// {@macro ShadTabs.padding}
  final EdgeInsets? padding;

  /// {@macro ShadTabs.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTabs.tabBarConstraints}
  final BoxConstraints? tabBarConstraints;

  /// {@macro ShadTabs.contentConstraints}
  final BoxConstraints? contentConstraints;

  /// {@macro ShadTabs.expandContent}
  final bool? expandContent;

  /// {@macro ShadTabs.tabWidth}
  final double? tabWidth;

  /// {@macro ShadTabs.tabBackgroundColor}
  final Color? tabBackgroundColor;

  /// {@macro ShadTabs.tabSelectedBackgroundColor}
  final Color? tabSelectedBackgroundColor;

  /// {@macro ShadTabs.tabHoverBackgroundColor}
  final Color? tabHoverBackgroundColor;

  /// {@macro ShadTabs.tabSelectedHoverBackgroundColor}
  final Color? tabSelectedHoverBackgroundColor;

  /// {@macro ShadTabs.tabPadding}
  final EdgeInsets? tabPadding;

  /// {@macro ShadTabs.tabDecoration}
  final ShadDecoration? tabDecoration;

  /// {@macro ShadTabs.tabSelectedDecoration}
  final ShadDecoration? tabSelectedDecoration;

  /// {@macro ShadTabs.tabForegroundColor}
  final Color? tabForegroundColor;

  /// {@macro ShadTabs.tabSelectedForegroundColor}
  final Color? tabSelectedForegroundColor;

  /// {@macro ShadTabs.tabTextStyle}
  final TextStyle? tabTextStyle;

  /// {@macro ShadTabs.tabShadows}
  final List<BoxShadow>? tabShadows;

  /// {@macro ShadTabs.tabSelectedShadows}
  final List<BoxShadow>? tabSelectedShadows;

  /// {@macro ShadTabs.tabSize}
  final ShadButtonSize? tabSize;

  /// {@macro ShadTabs.tabApplyIconColorFilter}
  final bool? tabApplyIconColorFilter;

  /// {@macro ShadTabs.tabCursor}
  final MouseCursor? tabCursor;

  /// {@macro ShadTabs.tabHoverForegroundColor}
  final Color? tabHoverForegroundColor;

  /// {@macro ShadTabs.tabPressedBackgroundColor}
  final Color? tabPressedBackgroundColor;

  /// {@macro ShadTabs.tabPressedForegroundColor}
  final Color? tabPressedForegroundColor;

  /// {@macro ShadTabs.tabGradient}
  final Gradient? tabGradient;

  /// {@macro ShadTabs.tabTextDecoration}
  final TextDecoration? tabTextDecoration;

  /// {@macro ShadTabs.tabHoverTextDecoration}
  final TextDecoration? tabHoverTextDecoration;

  /// {@macro ShadButton.tabMainAxisAlignment}
  final MainAxisAlignment? tabMainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? tabCrossAxisAlignment;

  /// {@macro ShadButton.tabHoverStrategies}
  final ShadHoverStrategies? tabHoverStrategies;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  static ShadTabsTheme lerp(
    ShadTabsTheme a,
    ShadTabsTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTabsTheme(
      merge: t < 0.5 ? a.merge : b.merge,
      gap: lerpDouble(a.gap, b.gap, t),
      dragStartBehavior: t < 0.5 ? a.dragStartBehavior : b.dragStartBehavior,
      physics: t < 0.5 ? a.physics : b.physics,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      tabBarConstraints:
          BoxConstraints.lerp(a.tabBarConstraints, b.tabBarConstraints, t),
      contentConstraints:
          BoxConstraints.lerp(a.contentConstraints, b.contentConstraints, t),
      expandContent: t < 0.5 ? a.expandContent : b.expandContent,
      tabWidth: lerpDouble(a.tabWidth, b.tabWidth, t),
      tabBackgroundColor:
          Color.lerp(a.tabBackgroundColor, b.tabBackgroundColor, t),
      tabSelectedBackgroundColor: Color.lerp(
        a.tabSelectedBackgroundColor,
        b.tabSelectedBackgroundColor,
        t,
      ),
      tabHoverBackgroundColor:
          Color.lerp(a.tabHoverBackgroundColor, b.tabHoverBackgroundColor, t),
      tabSelectedHoverBackgroundColor: Color.lerp(
        a.tabSelectedHoverBackgroundColor,
        b.tabSelectedHoverBackgroundColor,
        t,
      ),
      tabPadding: EdgeInsets.lerp(a.tabPadding, b.tabPadding, t),
      tabDecoration: ShadDecoration.lerp(a.tabDecoration, b.tabDecoration, t),
      tabSelectedDecoration: ShadDecoration.lerp(
        a.tabSelectedDecoration,
        b.tabSelectedDecoration,
        t,
      ),
      tabForegroundColor: Color.lerp(
        a.tabForegroundColor,
        b.tabForegroundColor,
        t,
      ),
      tabSelectedForegroundColor: Color.lerp(
        a.tabSelectedForegroundColor,
        b.tabSelectedForegroundColor,
        t,
      ),
      tabTextStyle: TextStyle.lerp(a.tabTextStyle, b.tabTextStyle, t),
      tabShadows: BoxShadow.lerpList(a.tabShadows, b.tabShadows, t),
      tabSelectedShadows:
          BoxShadow.lerpList(a.tabSelectedShadows, b.tabSelectedShadows, t),
      tabSize: t < 0.5 ? a.tabSize : b.tabSize,
      tabApplyIconColorFilter:
          t < 0.5 ? a.tabApplyIconColorFilter : b.tabApplyIconColorFilter,
      tabCursor: t < 0.5 ? a.tabCursor : b.tabCursor,
      tabHoverForegroundColor: Color.lerp(
        a.tabHoverForegroundColor,
        b.tabHoverForegroundColor,
        t,
      ),
      tabPressedBackgroundColor: Color.lerp(
        a.tabPressedBackgroundColor,
        b.tabPressedBackgroundColor,
        t,
      ),
      tabPressedForegroundColor: Color.lerp(
        a.tabPressedForegroundColor,
        b.tabPressedForegroundColor,
        t,
      ),
      tabGradient: Gradient.lerp(a.tabGradient, b.tabGradient, t),
      tabTextDecoration: t < 0.5 ? a.tabTextDecoration : b.tabTextDecoration,
      tabHoverTextDecoration:
          t < 0.5 ? a.tabHoverTextDecoration : b.tabHoverTextDecoration,
      tabMainAxisAlignment:
          t < 0.5 ? a.tabMainAxisAlignment : b.tabMainAxisAlignment,
      tabCrossAxisAlignment:
          t < 0.5 ? a.tabCrossAxisAlignment : b.tabCrossAxisAlignment,
      tabHoverStrategies: t < 0.5 ? a.tabHoverStrategies : b.tabHoverStrategies,
      longPressDuration: t < 0.5 ? a.longPressDuration : b.longPressDuration,
    );
  }

  ShadTabsTheme mergeWith(ShadTabsTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      gap: other.gap,
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
      tabTextStyle: other.tabTextStyle,
      tabShadows: other.tabShadows,
      tabSelectedShadows: other.tabSelectedShadows,
      tabSize: other.tabSize,
      tabApplyIconColorFilter: other.tabApplyIconColorFilter,
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
    if (identical(this, other)) return true;

    return other is ShadTabsTheme &&
        other.merge == merge &&
        other.gap == gap &&
        other.dragStartBehavior == dragStartBehavior &&
        other.physics == physics &&
        other.padding == padding &&
        other.decoration == decoration &&
        other.tabBarConstraints == tabBarConstraints &&
        other.contentConstraints == contentConstraints &&
        other.expandContent == expandContent &&
        other.tabWidth == tabWidth &&
        other.tabBackgroundColor == tabBackgroundColor &&
        other.tabSelectedBackgroundColor == tabSelectedBackgroundColor &&
        other.tabHoverBackgroundColor == tabHoverBackgroundColor &&
        other.tabSelectedHoverBackgroundColor ==
            tabSelectedHoverBackgroundColor &&
        other.tabPadding == tabPadding &&
        other.tabDecoration == tabDecoration &&
        other.tabSelectedDecoration == tabSelectedDecoration &&
        other.tabForegroundColor == tabForegroundColor &&
        other.tabSelectedForegroundColor == tabSelectedForegroundColor &&
        other.tabTextStyle == tabTextStyle &&
        listEquals(other.tabShadows, tabShadows) &&
        listEquals(other.tabSelectedShadows, tabSelectedShadows) &&
        other.tabSize == tabSize &&
        other.tabApplyIconColorFilter == tabApplyIconColorFilter &&
        other.tabCursor == tabCursor &&
        other.tabHoverForegroundColor == tabHoverForegroundColor &&
        other.tabPressedBackgroundColor == tabPressedBackgroundColor &&
        other.tabPressedForegroundColor == tabPressedForegroundColor &&
        other.tabGradient == tabGradient &&
        other.tabTextDecoration == tabTextDecoration &&
        other.tabHoverTextDecoration == tabHoverTextDecoration &&
        other.tabMainAxisAlignment == tabMainAxisAlignment &&
        other.tabCrossAxisAlignment == tabCrossAxisAlignment &&
        other.tabHoverStrategies == tabHoverStrategies &&
        other.longPressDuration == longPressDuration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        gap.hashCode ^
        dragStartBehavior.hashCode ^
        physics.hashCode ^
        padding.hashCode ^
        decoration.hashCode ^
        tabBarConstraints.hashCode ^
        contentConstraints.hashCode ^
        expandContent.hashCode ^
        tabWidth.hashCode ^
        tabBackgroundColor.hashCode ^
        tabSelectedBackgroundColor.hashCode ^
        tabHoverBackgroundColor.hashCode ^
        tabSelectedHoverBackgroundColor.hashCode ^
        tabPadding.hashCode ^
        tabDecoration.hashCode ^
        tabSelectedDecoration.hashCode ^
        tabForegroundColor.hashCode ^
        tabSelectedForegroundColor.hashCode ^
        tabTextStyle.hashCode ^
        tabShadows.hashCode ^
        tabSelectedShadows.hashCode ^
        tabSize.hashCode ^
        tabApplyIconColorFilter.hashCode ^
        tabCursor.hashCode ^
        tabHoverForegroundColor.hashCode ^
        tabPressedBackgroundColor.hashCode ^
        tabPressedForegroundColor.hashCode ^
        tabGradient.hashCode ^
        tabTextDecoration.hashCode ^
        tabHoverTextDecoration.hashCode ^
        tabMainAxisAlignment.hashCode ^
        tabCrossAxisAlignment.hashCode ^
        tabHoverStrategies.hashCode ^
        longPressDuration.hashCode;
  }

  ShadTabsTheme copyWith({
    bool? merge,
    double? gap,
    DragStartBehavior? dragStartBehavior,
    ScrollPhysics? physics,
    EdgeInsets? padding,
    ShadDecoration? decoration,
    BoxConstraints? tabBarConstraints,
    BoxConstraints? contentConstraints,
    bool? expandContent,
    double? tabWidth,
    Color? tabBackgroundColor,
    Color? tabSelectedBackgroundColor,
    Color? tabHoverBackgroundColor,
    Color? tabSelectedHoverBackgroundColor,
    EdgeInsets? tabPadding,
    ShadDecoration? tabDecoration,
    ShadDecoration? tabSelectedDecoration,
    Color? tabForegroundColor,
    Color? tabSelectedForegroundColor,
    TextStyle? tabTextStyle,
    List<BoxShadow>? tabShadows,
    List<BoxShadow>? tabSelectedShadows,
    ShadButtonSize? tabSize,
    bool? tabApplyIconColorFilter,
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
    return ShadTabsTheme(
      merge: merge ?? this.merge,
      gap: gap ?? this.gap,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      physics: physics ?? this.physics,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      tabBarConstraints: tabBarConstraints ?? this.tabBarConstraints,
      contentConstraints: contentConstraints ?? this.contentConstraints,
      expandContent: expandContent ?? this.expandContent,
      tabWidth: tabWidth ?? this.tabWidth,
      tabBackgroundColor: tabBackgroundColor ?? this.tabBackgroundColor,
      tabSelectedBackgroundColor:
          tabSelectedBackgroundColor ?? this.tabSelectedBackgroundColor,
      tabHoverBackgroundColor:
          tabHoverBackgroundColor ?? this.tabHoverBackgroundColor,
      tabSelectedHoverBackgroundColor: tabSelectedHoverBackgroundColor ??
          this.tabSelectedHoverBackgroundColor,
      tabPadding: tabPadding ?? this.tabPadding,
      tabDecoration: tabDecoration ?? this.tabDecoration,
      tabSelectedDecoration:
          tabSelectedDecoration ?? this.tabSelectedDecoration,
      tabForegroundColor: tabForegroundColor ?? this.tabForegroundColor,
      tabSelectedForegroundColor:
          tabSelectedForegroundColor ?? this.tabSelectedForegroundColor,
      tabTextStyle: tabTextStyle ?? this.tabTextStyle,
      tabShadows: tabShadows ?? this.tabShadows,
      tabSelectedShadows: tabSelectedShadows ?? this.tabSelectedShadows,
      tabSize: tabSize ?? this.tabSize,
      tabApplyIconColorFilter:
          tabApplyIconColorFilter ?? this.tabApplyIconColorFilter,
      tabCursor: tabCursor ?? this.tabCursor,
      tabHoverForegroundColor:
          tabHoverForegroundColor ?? this.tabHoverForegroundColor,
      tabPressedBackgroundColor:
          tabPressedBackgroundColor ?? this.tabPressedBackgroundColor,
      tabPressedForegroundColor:
          tabPressedForegroundColor ?? this.tabPressedForegroundColor,
      tabGradient: tabGradient ?? this.tabGradient,
      tabTextDecoration: tabTextDecoration ?? this.tabTextDecoration,
      tabHoverTextDecoration:
          tabHoverTextDecoration ?? this.tabHoverTextDecoration,
      tabMainAxisAlignment: tabMainAxisAlignment ?? this.tabMainAxisAlignment,
      tabCrossAxisAlignment:
          tabCrossAxisAlignment ?? this.tabCrossAxisAlignment,
      tabHoverStrategies: tabHoverStrategies ?? this.tabHoverStrategies,
      longPressDuration: longPressDuration ?? this.longPressDuration,
    );
  }
}
