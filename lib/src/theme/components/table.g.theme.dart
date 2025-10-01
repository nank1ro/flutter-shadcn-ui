// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'table.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTableTheme {
  bool get canMerge => true;

  static ShadTableTheme lerp(ShadTableTheme? a, ShadTableTheme? b, double t) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadTableTheme(
      diagonalDragBehavior:
          t < 0.5 ? a?.diagonalDragBehavior : b?.diagonalDragBehavior,
      dragStartBehavior: t < 0.5 ? a?.dragStartBehavior : b?.dragStartBehavior,
      keyboardDismissBehavior:
          t < 0.5 ? a?.keyboardDismissBehavior : b?.keyboardDismissBehavior,
      columnBuilder: t < 0.5 ? a?.columnBuilder : b?.columnBuilder,
      rowBuilder: t < 0.5 ? a?.rowBuilder : b?.rowBuilder,
      cellAlignment: Alignment.lerp(a?.cellAlignment, b?.cellAlignment, t),
      cellHeight: lerpDouble$(a?.cellHeight, b?.cellHeight, t),
      cellPadding: EdgeInsetsGeometry.lerp(a?.cellPadding, b?.cellPadding, t),
      cellHeaderStyle: TextStyle.lerp(
        a?.cellHeaderStyle,
        b?.cellHeaderStyle,
        t,
      ),
      cellStyle: TextStyle.lerp(a?.cellStyle, b?.cellStyle, t),
      cellFooterStyle: TextStyle.lerp(
        a?.cellFooterStyle,
        b?.cellFooterStyle,
        t,
      ),
    );
  }

  ShadTableTheme copyWith({
    DiagonalDragBehavior? diagonalDragBehavior,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    Span? Function(int)? columnBuilder,
    Span? Function(int)? rowBuilder,
    Alignment? cellAlignment,
    double? cellHeight,
    EdgeInsetsGeometry? cellPadding,
    TextStyle? cellHeaderStyle,
    TextStyle? cellStyle,
    TextStyle? cellFooterStyle,
  }) {
    final a = (this as ShadTableTheme);

    return ShadTableTheme(
      diagonalDragBehavior: diagonalDragBehavior ?? a.diagonalDragBehavior,
      dragStartBehavior: dragStartBehavior ?? a.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? a.keyboardDismissBehavior,
      columnBuilder: columnBuilder ?? a.columnBuilder,
      rowBuilder: rowBuilder ?? a.rowBuilder,
      cellAlignment: cellAlignment ?? a.cellAlignment,
      cellHeight: cellHeight ?? a.cellHeight,
      cellPadding: cellPadding ?? a.cellPadding,
      cellHeaderStyle: cellHeaderStyle ?? a.cellHeaderStyle,
      cellStyle: cellStyle ?? a.cellStyle,
      cellFooterStyle: cellFooterStyle ?? a.cellFooterStyle,
    );
  }

  ShadTableTheme merge(ShadTableTheme? other) {
    final current = (this as ShadTableTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      diagonalDragBehavior: other.diagonalDragBehavior,
      dragStartBehavior: other.dragStartBehavior,
      keyboardDismissBehavior: other.keyboardDismissBehavior,
      columnBuilder: other.columnBuilder,
      rowBuilder: other.rowBuilder,
      cellAlignment: other.cellAlignment,
      cellHeight: other.cellHeight,
      cellPadding: other.cellPadding,
      cellHeaderStyle: current.cellHeaderStyle?.merge(other.cellHeaderStyle) ??
          other.cellHeaderStyle,
      cellStyle: current.cellStyle?.merge(other.cellStyle) ?? other.cellStyle,
      cellFooterStyle: current.cellFooterStyle?.merge(other.cellFooterStyle) ??
          other.cellFooterStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadTableTheme);

    return other is ShadTableTheme &&
        other.diagonalDragBehavior == value.diagonalDragBehavior &&
        other.dragStartBehavior == value.dragStartBehavior &&
        other.keyboardDismissBehavior == value.keyboardDismissBehavior &&
        other.columnBuilder == value.columnBuilder &&
        other.rowBuilder == value.rowBuilder &&
        other.cellAlignment == value.cellAlignment &&
        other.cellHeight == value.cellHeight &&
        other.cellPadding == value.cellPadding &&
        other.cellHeaderStyle == value.cellHeaderStyle &&
        other.cellStyle == value.cellStyle &&
        other.cellFooterStyle == value.cellFooterStyle;
  }

  @override
  int get hashCode {
    final value = (this as ShadTableTheme);

    return Object.hash(
      runtimeType,
      value.diagonalDragBehavior,
      value.dragStartBehavior,
      value.keyboardDismissBehavior,
      value.columnBuilder,
      value.rowBuilder,
      value.cellAlignment,
      value.cellHeight,
      value.cellPadding,
      value.cellHeaderStyle,
      value.cellStyle,
      value.cellFooterStyle,
    );
  }
}
