import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

typedef ShadTableCellBuilder = ShadTableCell Function(
  BuildContext context,
  TableVicinity vicinity,
);

enum ShadTableCellType {
  header,
  cell,
  footer,
}

class ShadTableCell extends TableViewCell {
  const ShadTableCell({
    super.key,
    this.alignment,
    this.height,
    required super.child,
    this.padding,
  }) : type = ShadTableCellType.cell;

  const ShadTableCell.header({
    super.key,
    this.alignment,
    this.height,
    required super.child,
    this.padding,
  }) : type = ShadTableCellType.header;

  const ShadTableCell.footer({
    super.key,
    this.alignment,
    this.height,
    required super.child,
    this.padding,
  }) : type = ShadTableCellType.footer;

  final ShadTableCellType type;
  final Alignment? alignment;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlignment = alignment
        // ?? theme.tableCellTheme.alignment
        ??
        Alignment.centerLeft;

    final effectiveHeight = height
        //?? theme.tableCellTheme.height
        ??
        48;

    final effectivePadding = padding
        // ?? theme.tableCellTheme.padding
        ??
        const EdgeInsets.symmetric(horizontal: 16);

    final textStyle = switch (type) {
      ShadTableCellType.cell =>
        theme.textTheme.muted.copyWith(color: theme.colorScheme.foreground),
      ShadTableCellType.header => theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ShadTableCellType.footer => theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.foreground,
        ),
    };

    return TableViewCell(
      child: Container(
        height: effectiveHeight,
        alignment: effectiveAlignment,
        padding: effectivePadding,
        child: DefaultTextStyle(
          style: textStyle,
          child: child,
        ),
      ),
    );
  }
}

class ShadTable extends StatefulWidget {
  const ShadTable({
    super.key,
    required this.builder,
    required this.columnCount,
    required this.rowCount,
    this.header,
    this.footer,
    this.caption,
    this.height,
    this.columnBuilder,
    this.rowBuilder,
    this.cellBuilder,
    this.rowSpanExtent,
    this.columnSpanExtent,
    this.rowSpanBackgroundDecoration,
    this.rowSpanForegroundDecoration,
    this.columnSpanBackgroundDecoration,
    this.columnSpanForegroundDecoration,
    this.hoveredRowIndex,
    this.horizontalScrollController,
    this.verticalScrollController,
  });

  final ShadTableCell Function(BuildContext context, int column)? header;
  final ShadTableCell Function(BuildContext context, int column)? footer;
  final Widget? caption;
  final ShadTableCellBuilder builder;
  final int columnCount;
  final int rowCount;
  final double? height;

  final TableSpanBuilder? columnBuilder;
  final TableSpanBuilder? rowBuilder;
  final ShadTableCellBuilder? cellBuilder;
  final TableSpanExtent? Function(int row)? rowSpanExtent;
  final TableSpanExtent? Function(int column)? columnSpanExtent;
  final TableSpanDecoration? Function(int row)? rowSpanBackgroundDecoration;
  final TableSpanDecoration? Function(int row)? rowSpanForegroundDecoration;
  final TableSpanDecoration? Function(int column)?
      columnSpanBackgroundDecoration;
  final TableSpanDecoration? Function(int column)?
      columnSpanForegroundDecoration;
  final ValueChanged<int?>? hoveredRowIndex;
  final ScrollController? verticalScrollController;
  final ScrollController? horizontalScrollController;

  @override
  State<ShadTable> createState() => _ShadTableState();
}

class _ShadTableState extends State<ShadTable> {
  int hoveredIndex = -1;
  late double? tableHeight = widget.height;
  double viewportHeight = 0;

  /// This is a workaround to avoid rebuilding the same row when the pointer
  /// doesn't move, because when you call setState, the onExit callback is
  /// called, even if the pointer is still hovering, and the onEnter callback is
  /// called again, causing an infinite loop.
  Offset? previousPointerOffset;

  int get effectiveRowCount =>
      widget.rowCount +
      (widget.header != null ? 1 : 0) +
      (widget.footer != null ? 1 : 0);

  @override
  void initState() {
    super.initState();
    tableHeight ??= calculateTableHeight();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewportHeight = MediaQuery.sizeOf(context).height;
  }

  @override
  void didUpdateWidget(covariant ShadTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.height != oldWidget.height ||
        widget.rowCount != oldWidget.rowCount ||
        widget.rowSpanExtent != oldWidget.rowSpanExtent) {
      tableHeight = widget.height;
      tableHeight ??= calculateTableHeight();
    }
  }

  double? calculateTableHeight() {
    const defaultRowHeight = 48.0;
    var calculatedHeight = 0.0;
    for (var i = 0; i < effectiveRowCount; i++) {
      var rowHeight = 0.0;
      final extent = widget.rowSpanExtent?.call(i);
      if (extent != null) {
        rowHeight = extent.calculateExtent(
          TableSpanExtentDelegate(
            viewportExtent: viewportHeight,
            precedingExtent: calculatedHeight,
          ),
        );
      } else {
        rowHeight = defaultRowHeight;
      }
      calculatedHeight += rowHeight;
    }

    return calculatedHeight;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveRowBuilder =
        widget.rowBuilder ?? (i) => _buildRowSpan(i, effectiveRowCount);

    final effectiveColumnBuilder = widget.columnBuilder ?? _buildColumnSpan;

    final effectiveTableHeight = tableHeight == null
        ? null
        : tableHeight! > viewportHeight
            ? null
            : tableHeight;

    Widget table = TableView.builder(
      verticalDetails: ScrollableDetails.vertical(
        controller: widget.verticalScrollController,
      ),
      horizontalDetails: ScrollableDetails.horizontal(
        controller: widget.horizontalScrollController,
      ),
      cellBuilder: (context, index) {
        if (index.row == 0 && widget.header != null) {
          return widget.header!(context, index.column);
        }
        if (index.row == effectiveRowCount - 1 && widget.footer != null) {
          return widget.footer!(context, index.column);
        }

        final realVicinity = TableVicinity(
          row: index.row - (widget.header != null ? 1 : 0),
          column: index.column,
        );

        return widget.builder(context, realVicinity);
      },
      columnCount: widget.columnCount,
      columnBuilder: effectiveColumnBuilder,
      rowCount: effectiveRowCount,
      rowBuilder: effectiveRowBuilder,
    );

    if (widget.caption != null) {
      table = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
              width: double.infinity,
              height: effectiveTableHeight,
              child: table,
            ),
          ),
          DefaultTextStyle(
            style: theme.textTheme.muted,
            textAlign: TextAlign.center,
            child: widget.caption!,
          ),
        ],
      );
    }

    return table;
  }

  TableSpan _buildColumnSpan(int index) {
    final requestedColumnSpanExtent = widget.columnSpanExtent?.call(index);
    final effectiveColumnSpanExtent =
        requestedColumnSpanExtent ?? const FixedTableSpanExtent(100);

    return TableSpan(
      extent: effectiveColumnSpanExtent,
      backgroundDecoration: widget.columnSpanBackgroundDecoration?.call(index),
      foregroundDecoration: widget.columnSpanForegroundDecoration?.call(index),
    );
  }

  TableSpan _buildRowSpan(int index, int effectiveRowCount) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final isLast = index == effectiveRowCount - 1;
    final isFooter = isLast && widget.footer != null;

    final requestedRowSpanExtent = widget.rowSpanExtent?.call(index);
    final effectiveRowSpanExtent =
        requestedRowSpanExtent ?? const FixedTableSpanExtent(48);

    return TableSpan(
      backgroundDecoration: widget.rowSpanBackgroundDecoration?.call(index) ??
          TableSpanDecoration(
            color: hoveredIndex == index
                ? colorScheme.muted.withOpacity(isFooter ? 1 : .5)
                : isFooter
                    ? colorScheme.muted.withOpacity(.5)
                    : null,
            border: TableSpanBorder(
              trailing: isLast
                  ? BorderSide.none
                  : BorderSide(color: colorScheme.border),
            ),
          ),
      foregroundDecoration: widget.rowSpanForegroundDecoration?.call(index),
      extent: effectiveRowSpanExtent,
      onEnter: (p) {
        if (hoveredIndex == index) return;
        previousPointerOffset = p.position;
        setState(() => hoveredIndex = index);
        widget.hoveredRowIndex?.call(index);
      },
      onExit: (p) {
        if (hoveredIndex != index) return;
        if (previousPointerOffset == p.position) return;
        setState(() => hoveredIndex = -1);
        widget.hoveredRowIndex?.call(null);
      },
    );
  }
}
