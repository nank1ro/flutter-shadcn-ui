import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputTheme {
  const ShadInputTheme({
    this.merge = true,
    this.decoration,
  });

  final bool merge;
  final ShadDecoration? decoration;

  static ShadInputTheme lerp(
    ShadInputTheme a,
    ShadInputTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadInputTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
    );
  }

  ShadInputTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
  }) {
    return ShadInputTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
    );
  }

  ShadInputTheme mergeWith(ShadInputTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: other.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadInputTheme &&
        other.merge == merge &&
        other.decoration == decoration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^ decoration.hashCode;
  }
}
