import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';

@immutable
class ShadOptionTheme {
  const ShadOptionTheme({
    this.merge = true,
    this.hoveredBackgroundColor,
    this.padding,
    this.radius,
    this.orderPolicy,
  });

  final bool merge;

  final Color? hoveredBackgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? radius;

  /// {@macro ShadOption.orderPolicy}
  final WidgetOrderPolicy? orderPolicy;

  static ShadOptionTheme lerp(
    ShadOptionTheme a,
    ShadOptionTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadOptionTheme(
      merge: b.merge,
      hoveredBackgroundColor:
          Color.lerp(a.hoveredBackgroundColor, b.hoveredBackgroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      orderPolicy: t < 0.5 ? a.orderPolicy : b.orderPolicy,
    );
  }

  ShadOptionTheme copyWith({
    bool? merge,
    Color? hoveredBackgroundColor,
    EdgeInsets? padding,
    BorderRadius? radius,
    WidgetOrderPolicy? orderPolicy,
  }) {
    return ShadOptionTheme(
      merge: merge ?? this.merge,
      hoveredBackgroundColor:
          hoveredBackgroundColor ?? this.hoveredBackgroundColor,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      orderPolicy: orderPolicy ?? this.orderPolicy,
    );
  }

  ShadOptionTheme mergeWith(ShadOptionTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      hoveredBackgroundColor: other.hoveredBackgroundColor,
      padding: other.padding,
      radius: other.radius,
      orderPolicy: other.orderPolicy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadOptionTheme &&
        other.merge == merge &&
        other.hoveredBackgroundColor == hoveredBackgroundColor &&
        other.padding == padding &&
        other.radius == radius &&
        other.orderPolicy == orderPolicy;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        hoveredBackgroundColor.hashCode ^
        padding.hashCode ^
        radius.hashCode ^
        orderPolicy.hashCode;
  }
}
