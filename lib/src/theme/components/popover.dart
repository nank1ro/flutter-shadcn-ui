import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

@immutable
class ShadPopoverTheme {
  const ShadPopoverTheme({
    this.merge = true,
    this.waitDuration,
    this.showDuration,
    this.offset,
    this.effects,
    this.shadows,
    this.alignment,
    this.childAlignment,
    this.padding,
    this.decoration,
  });

  final bool merge;

  /// {@macro popover.waitDuration}
  final Duration? waitDuration;

  /// {@macro popover.showDuration}
  final Duration? showDuration;

  /// {@macro popover.offset}
  final Offset? offset;

  /// {@macro popover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro popover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro popover.alignment}
  final Alignment? alignment;

  /// {@macro popover.childAlignment}
  final Alignment? childAlignment;

  /// {@macro popover.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro popover.decoration}
  final BoxDecoration? decoration;

  static ShadPopoverTheme lerp(
    ShadPopoverTheme a,
    ShadPopoverTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadPopoverTheme(
      merge: b.merge,
    );
  }

  ShadPopoverTheme copyWith({
    bool? merge,
    Duration? waitDuration,
    Duration? showDuration,
    Offset? offset,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    Alignment? alignment,
    Alignment? childAlignment,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
  }) {
    return ShadPopoverTheme(
      merge: merge ?? this.merge,
      waitDuration: waitDuration ?? this.waitDuration,
      showDuration: showDuration ?? this.showDuration,
      offset: offset ?? this.offset,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      alignment: alignment ?? this.alignment,
      childAlignment: childAlignment ?? this.childAlignment,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
    );
  }

  ShadPopoverTheme mergeWith(ShadPopoverTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      waitDuration: other.waitDuration,
      showDuration: other.showDuration,
      offset: other.offset,
      effects: other.effects,
      shadows: other.shadows,
      alignment: other.alignment,
      childAlignment: other.childAlignment,
      padding: other.padding,
      decoration: other.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadPopoverTheme &&
        other.merge == merge &&
        other.waitDuration == waitDuration &&
        other.showDuration == showDuration &&
        other.offset == offset &&
        listEquals(other.effects, effects) &&
        listEquals(other.shadows, shadows) &&
        other.alignment == alignment &&
        other.childAlignment == childAlignment &&
        other.padding == padding &&
        other.decoration == decoration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        waitDuration.hashCode ^
        showDuration.hashCode ^
        offset.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        alignment.hashCode ^
        childAlignment.hashCode ^
        padding.hashCode ^
        decoration.hashCode;
  }
}
