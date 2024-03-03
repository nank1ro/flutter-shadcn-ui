import 'package:flutter/widgets.dart';

@immutable
class ShadAccordionTheme {
  const ShadAccordionTheme({
    this.merge = true,
  });

  final bool merge;

  static ShadAccordionTheme lerp(
    ShadAccordionTheme a,
    ShadAccordionTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadAccordionTheme(
      merge: b.merge,
    );
  }

  ShadAccordionTheme copyWith({
    bool? merge,
  }) {
    return ShadAccordionTheme(
      merge: merge ?? this.merge,
    );
  }

  ShadAccordionTheme mergeWith(ShadAccordionTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAccordionTheme && other.merge == merge;
  }

  @override
  int get hashCode => merge.hashCode;
}
