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

  static ShadTableTheme? lerp(ShadTableTheme? a, ShadTableTheme? b, double t) {
    if (a == null && b == null) {
      return null;
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
    final _this = (this as ShadTableTheme);

    return ShadTableTheme(
      diagonalDragBehavior: diagonalDragBehavior ?? _this.diagonalDragBehavior,
      dragStartBehavior: dragStartBehavior ?? _this.dragStartBehavior,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? _this.keyboardDismissBehavior,
      columnBuilder: columnBuilder ?? _this.columnBuilder,
      rowBuilder: rowBuilder ?? _this.rowBuilder,
      cellAlignment: cellAlignment ?? _this.cellAlignment,
      cellHeight: cellHeight ?? _this.cellHeight,
      cellPadding: cellPadding ?? _this.cellPadding,
      cellHeaderStyle: cellHeaderStyle ?? _this.cellHeaderStyle,
      cellStyle: cellStyle ?? _this.cellStyle,
      cellFooterStyle: cellFooterStyle ?? _this.cellFooterStyle,
    );
  }

  ShadTableTheme merge(ShadTableTheme? other) {
    final _this = (this as ShadTableTheme);

    if (other == null) {
      return _this;
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
      cellHeaderStyle: _this.cellHeaderStyle?.merge(other.cellHeaderStyle) ??
          other.cellHeaderStyle,
      cellStyle: _this.cellStyle?.merge(other.cellStyle) ?? other.cellStyle,
      cellFooterStyle: _this.cellFooterStyle?.merge(other.cellFooterStyle) ??
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

    final _this = (this as ShadTableTheme);
    final _other = (other as ShadTableTheme);

    return _other.diagonalDragBehavior == _this.diagonalDragBehavior &&
        _other.dragStartBehavior == _this.dragStartBehavior &&
        _other.keyboardDismissBehavior == _this.keyboardDismissBehavior &&
        _other.columnBuilder == _this.columnBuilder &&
        _other.rowBuilder == _this.rowBuilder &&
        _other.cellAlignment == _this.cellAlignment &&
        _other.cellHeight == _this.cellHeight &&
        _other.cellPadding == _this.cellPadding &&
        _other.cellHeaderStyle == _this.cellHeaderStyle &&
        _other.cellStyle == _this.cellStyle &&
        _other.cellFooterStyle == _this.cellFooterStyle;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTableTheme);

    return Object.hash(
      runtimeType,
      _this.diagonalDragBehavior,
      _this.dragStartBehavior,
      _this.keyboardDismissBehavior,
      _this.columnBuilder,
      _this.rowBuilder,
      _this.cellAlignment,
      _this.cellHeight,
      _this.cellPadding,
      _this.cellHeaderStyle,
      _this.cellStyle,
      _this.cellFooterStyle,
    );
  }
}
