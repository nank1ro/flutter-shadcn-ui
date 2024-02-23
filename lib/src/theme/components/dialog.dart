import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/utils/position.dart';

@immutable
class ShadDialogTheme {
  const ShadDialogTheme({
    this.merge = true,
    this.closeIconSrc,
    this.closeIconPosition,
    this.radius,
  });

  final bool merge;
  final String? closeIconSrc;
  final ShadPosition? closeIconPosition;
  final BorderRadius? radius;

  static ShadDialogTheme lerp(
    ShadDialogTheme a,
    ShadDialogTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDialogTheme(
      merge: b.merge,
      closeIconSrc: b.closeIconSrc,
      closeIconPosition:
          ShadPosition.lerp(a.closeIconPosition, b.closeIconPosition, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
    );
  }

  ShadDialogTheme copyWith({
    bool? merge,
    String? closeIconSrc,
    ShadPosition? closeIconPosition,
    BorderRadius? radius,
  }) {
    return ShadDialogTheme(
      merge: merge ?? this.merge,
      closeIconSrc: closeIconSrc,
      closeIconPosition: closeIconPosition,
      radius: radius,
    );
  }

  ShadDialogTheme mergeWith(ShadDialogTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      closeIconSrc: other.closeIconSrc,
      closeIconPosition: other.closeIconPosition,
      radius: other.radius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDialogTheme &&
        other.merge == merge &&
        other.closeIconPosition == closeIconPosition &&
        other.closeIconSrc == closeIconSrc &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        closeIconSrc.hashCode ^
        closeIconPosition.hashCode ^
        radius.hashCode;
  }
}
