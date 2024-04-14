import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

@immutable
class ShadTableTheme {
  const ShadTableTheme({
    this.merge = true,
    this.diagonalDragBehavior,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.columnBuilder,
    this.rowBuilder,
  });

  final bool merge;
  final DiagonalDragBehavior? diagonalDragBehavior;
  final DragStartBehavior? dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final TableSpanBuilder? columnBuilder;
  final TableSpanBuilder? rowBuilder;

  static ShadTableTheme lerp(
    ShadTableTheme a,
    ShadTableTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTableTheme(
      merge: b.merge,
      diagonalDragBehavior: b.diagonalDragBehavior ?? a.diagonalDragBehavior,
      dragStartBehavior: b.dragStartBehavior ?? a.dragStartBehavior,
      keyboardDismissBehavior:
          b.keyboardDismissBehavior ?? a.keyboardDismissBehavior,
      columnBuilder: b.columnBuilder ?? a.columnBuilder,
      rowBuilder: b.rowBuilder ?? a.rowBuilder,
    );
  }

  ShadTableTheme mergeWith(ShadTableTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      diagonalDragBehavior: other.diagonalDragBehavior ?? diagonalDragBehavior,
      dragStartBehavior: other.dragStartBehavior ?? dragStartBehavior,
      keyboardDismissBehavior:
          other.keyboardDismissBehavior ?? keyboardDismissBehavior,
      columnBuilder: other.columnBuilder ?? columnBuilder,
      rowBuilder: other.rowBuilder ?? rowBuilder,
    );
  }

  ShadTableTheme copyWith({
    bool? merge,
    DiagonalDragBehavior? diagonalDragBehavior,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    TableSpanBuilder? columnBuilder,
    TableSpanBuilder? rowBuilder,
  }) {
    return ShadTableTheme(
      merge: merge ?? this.merge,
      diagonalDragBehavior: diagonalDragBehavior ?? this.diagonalDragBehavior,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? this.keyboardDismissBehavior,
      columnBuilder: columnBuilder ?? this.columnBuilder,
      rowBuilder: rowBuilder ?? this.rowBuilder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadTableTheme &&
        other.merge == merge &&
        other.diagonalDragBehavior == diagonalDragBehavior &&
        other.dragStartBehavior == dragStartBehavior &&
        other.keyboardDismissBehavior == keyboardDismissBehavior &&
        other.columnBuilder == columnBuilder &&
        other.rowBuilder == rowBuilder;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        diagonalDragBehavior.hashCode ^
        dragStartBehavior.hashCode ^
        keyboardDismissBehavior.hashCode ^
        columnBuilder.hashCode ^
        rowBuilder.hashCode;
  }
}
