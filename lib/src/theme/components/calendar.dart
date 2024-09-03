import 'package:flutter/widgets.dart';

@immutable
class ShadCalendarTheme {
  const ShadCalendarTheme({
    this.merge = true,
  });

  final bool merge;

  static ShadCalendarTheme lerp(
    ShadCalendarTheme a,
    ShadCalendarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadCalendarTheme(
      merge: b.merge,
    );
  }

  ShadCalendarTheme copyWith({
    bool? merge,
  }) {
    return ShadCalendarTheme(
      merge: merge ?? this.merge,
    );
  }

  ShadCalendarTheme mergeWith(ShadCalendarTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadCalendarTheme && other.merge == merge;
  }

  @override
  int get hashCode {
    return merge.hashCode;
  }
}
