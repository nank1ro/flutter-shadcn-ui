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
    this.cellAlignment,
    this.cellHeight,
    this.cellPadding,
    this.cellStyle,
    this.cellHeaderStyle,
    this.cellFooterStyle,
  });

  final bool merge;
  final DiagonalDragBehavior? diagonalDragBehavior;
  final DragStartBehavior? dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final TableSpanBuilder? columnBuilder;
  final TableSpanBuilder? rowBuilder;
  final Alignment? cellAlignment;
  final double? cellHeight;
  final EdgeInsets? cellPadding;
  final TextStyle? cellHeaderStyle;
  final TextStyle? cellStyle;
  final TextStyle? cellFooterStyle;

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
      cellAlignment: b.cellAlignment ?? a.cellAlignment,
      cellHeight: b.cellHeight ?? a.cellHeight,
      cellPadding: b.cellPadding ?? a.cellPadding,
      cellStyle: b.cellStyle ?? a.cellStyle,
      cellHeaderStyle: b.cellHeaderStyle ?? a.cellHeaderStyle,
      cellFooterStyle: b.cellFooterStyle ?? a.cellFooterStyle,
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
      cellAlignment: other.cellAlignment ?? cellAlignment,
      cellHeight: other.cellHeight ?? cellHeight,
      cellPadding: other.cellPadding ?? cellPadding,
      cellStyle: other.cellStyle ?? cellStyle,
      cellHeaderStyle: other.cellHeaderStyle ?? cellHeaderStyle,
      cellFooterStyle: other.cellFooterStyle ?? cellFooterStyle,
    );
  }

  ShadTableTheme copyWith({
    bool? merge,
    DiagonalDragBehavior? diagonalDragBehavior,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    TableSpanBuilder? columnBuilder,
    TableSpanBuilder? rowBuilder,
    Alignment? cellAlignment,
    double? cellHeight,
    EdgeInsets? cellPadding,
    TextStyle? cellStyle,
    TextStyle? cellHeaderStyle,
    TextStyle? cellFooterStyle,
  }) {
    return ShadTableTheme(
      merge: merge ?? this.merge,
      diagonalDragBehavior: diagonalDragBehavior ?? this.diagonalDragBehavior,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? this.keyboardDismissBehavior,
      columnBuilder: columnBuilder ?? this.columnBuilder,
      rowBuilder: rowBuilder ?? this.rowBuilder,
      cellAlignment: cellAlignment ?? this.cellAlignment,
      cellHeight: cellHeight ?? this.cellHeight,
      cellPadding: cellPadding ?? this.cellPadding,
      cellStyle: cellStyle ?? this.cellStyle,
      cellHeaderStyle: cellHeaderStyle ?? this.cellHeaderStyle,
      cellFooterStyle: cellFooterStyle ?? this.cellFooterStyle,
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
        other.rowBuilder == rowBuilder &&
        other.cellAlignment == cellAlignment &&
        other.cellHeight == cellHeight &&
        other.cellPadding == cellPadding &&
        other.cellStyle == cellStyle &&
        other.cellHeaderStyle == cellHeaderStyle &&
        other.cellFooterStyle == cellFooterStyle;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        diagonalDragBehavior.hashCode ^
        dragStartBehavior.hashCode ^
        keyboardDismissBehavior.hashCode ^
        columnBuilder.hashCode ^
        rowBuilder.hashCode ^
        cellAlignment.hashCode ^
        cellHeight.hashCode ^
        cellPadding.hashCode ^
        cellStyle.hashCode ^
        cellHeaderStyle.hashCode ^
        cellFooterStyle.hashCode;
  }
}
