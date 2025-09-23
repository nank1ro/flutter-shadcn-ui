import 'dart:ui';

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

  /// {@macro ShadTable.diagonalDragBehavior}
  final DiagonalDragBehavior? diagonalDragBehavior;

  /// {@macro ShadTable.dragStartBehavior}
  final DragStartBehavior? dragStartBehavior;

  /// {@macro ShadTable.keyboardDismissBehavior}
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  /// {@macro ShadTable.columnBuilder}
  final TableSpanBuilder? columnBuilder;

  /// {@macro ShadTable.rowBuilder}
  final TableSpanBuilder? rowBuilder;

  /// {@macro ShadTable.cellAlignment}
  final Alignment? cellAlignment;

  /// {@macro ShadTable.cellHeight}
  final double? cellHeight;

  /// {@macro ShadTable.cellPadding}
  final EdgeInsetsGeometry? cellPadding;

  /// {@macro ShadTable.cellHeaderStyle}
  final TextStyle? cellHeaderStyle;

  /// {@macro ShadTable.cellStyle}
  final TextStyle? cellStyle;

  /// {@macro ShadTable.cellFooterStyle}
  final TextStyle? cellFooterStyle;

  static ShadTableTheme lerp(
    ShadTableTheme a,
    ShadTableTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTableTheme(
      merge: b.merge,
      diagonalDragBehavior:
          t < 0.5 ? a.diagonalDragBehavior : b.diagonalDragBehavior,
      dragStartBehavior: t < 0.5 ? a.dragStartBehavior : b.dragStartBehavior,
      keyboardDismissBehavior:
          t < 0.5 ? a.keyboardDismissBehavior : b.keyboardDismissBehavior,
      columnBuilder: t < 0.5 ? a.columnBuilder : b.columnBuilder,
      rowBuilder: t < 0.5 ? a.rowBuilder : b.rowBuilder,
      cellAlignment: t < 0.5 ? a.cellAlignment : b.cellAlignment,
      cellHeight: lerpDouble(a.cellHeight, b.cellHeight, t),
      cellPadding: EdgeInsetsGeometry.lerp(a.cellPadding, b.cellPadding, t),
      cellStyle: TextStyle.lerp(a.cellStyle, b.cellStyle, t),
      cellHeaderStyle: TextStyle.lerp(a.cellHeaderStyle, b.cellHeaderStyle, t),
      cellFooterStyle: TextStyle.lerp(a.cellFooterStyle, b.cellFooterStyle, t),
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
    EdgeInsetsGeometry? cellPadding,
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
