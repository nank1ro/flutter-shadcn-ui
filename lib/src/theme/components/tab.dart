import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

@immutable
class ShadTabTheme {
  const ShadTabTheme({
    this.merge = true,
  });

  final bool merge;

  static ShadTabTheme lerp(
    ShadTabTheme a,
    ShadTabTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTabTheme(
      merge: t < 0.5 ? a.merge : b.merge,
    );
  }

  ShadTabTheme mergeWith(ShadTabTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadTabTheme && other.merge == merge;
  }

  @override
  int get hashCode {
    return merge.hashCode;
  }

  ShadTabTheme copyWith({
    bool? merge,
  }) {
    return ShadTabTheme(
      merge: merge ?? this.merge,
    );
  }
}
