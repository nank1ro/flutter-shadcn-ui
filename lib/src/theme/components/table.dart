import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

part 'table.g.theme.dart';

@themeGen
@immutable
class ShadTableTheme with _$ShadTableTheme {
  const ShadTableTheme({
    bool canMerge = true,
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
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

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
  ) =>
      _$ShadTableTheme.lerp(a, b, t);
}
