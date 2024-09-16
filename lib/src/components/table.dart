// ignore_for_file: cascade_invocations

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

typedef ShadTableCellBuilder = ShadTableCell Function(
  BuildContext context,
  TableVicinity vicinity,
);

enum ShadTableCellVariant {
  header,
  cell,
  footer,
}

class ShadTableCell extends TableViewCell {
  const ShadTableCell({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.cell;

  const ShadTableCell.header({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.header;

  const ShadTableCell.footer({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.footer;

  const ShadTableCell.raw({
    super.key,
    required this.variant,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  });

  final ShadTableCellVariant variant;
  final Alignment? alignment;
  final double? height;
  final EdgeInsets? padding;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlignment =
        alignment ?? theme.tableTheme.cellAlignment ?? Alignment.centerLeft;

    final effectiveHeight = height ?? theme.tableTheme.cellHeight ?? 48;

    final effectivePadding = padding ??
        theme.tableTheme.cellPadding ??
        const EdgeInsets.symmetric(horizontal: 16);

    final textStyle = style ??
        switch (variant) {
          ShadTableCellVariant.cell => theme.tableTheme.cellStyle ??
              theme.textTheme.muted
                  .copyWith(color: theme.colorScheme.foreground),
          ShadTableCellVariant.header => theme.tableTheme.cellHeaderStyle ??
              theme.textTheme.muted.copyWith(
                fontWeight: FontWeight.w500,
              ),
          ShadTableCellVariant.footer => theme.tableTheme.cellFooterStyle ??
              theme.textTheme.muted.copyWith(
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
  /// Creates a [ShadTable] of widgets that are created on demand.
  ///
  /// This constructor is appropriate for table views with a large
  /// number of cells because the [builder] is called only for those
  /// cells that are actually visible.
  const ShadTable({
    super.key,
    required ShadTableCellBuilder this.builder,
    required this.columnCount,
    required this.rowCount,
    ShadTableCell Function(BuildContext context, int column)? header,
    ShadTableCell Function(BuildContext context, int column)? footer,
    this.columnBuilder,
    this.rowBuilder,
    this.rowSpanExtent,
    this.columnSpanExtent,
    this.rowSpanBackgroundDecoration,
    this.rowSpanForegroundDecoration,
    this.columnSpanBackgroundDecoration,
    this.columnSpanForegroundDecoration,
    this.onHoveredRowIndex,
    this.horizontalScrollController,
    this.verticalScrollController,
    this.pinnedRowCount,
    this.pinnedColumnCount,
    this.primary,
    this.diagonalDragBehavior,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.verticalScrollPhysics,
    this.horizontalScrollPhysics,
    this.onRowTap,
    this.onColumnTap,
    this.supportedDevices,
    this.onRowTapDown,
    this.onRowTapUp,
    this.onRowTapCancel,
    this.onRowSecondaryTap,
    this.onRowSecondaryTapDown,
    this.onRowSecondaryTapUp,
    this.onRowSecondaryTapCancel,
    this.onColumnTapDown,
    this.onColumnTapUp,
    this.onColumnTapCancel,
    this.onColumnSecondaryTap,
    this.onColumnSecondaryTapDown,
    this.onColumnSecondaryTapUp,
    this.onColumnSecondaryTapCancel,
  })  : children = null,
        headerBuilder = header,
        footerBuilder = footer,
        header = null,
        footer = null;

  /// Creates a [ShadTable] from an explicit two dimensional array of
  /// [children].
  ///
  /// This constructor is appropriate for list views with a small number of
  /// children because constructing the [List] requires doing work for every
  /// child that could possibly be displayed in the list view instead of just
  /// those children that are actually visible.
  ShadTable.list({
    super.key,
    required Iterable<Iterable<ShadTableCell>> this.children,
    this.header,
    this.footer,
    this.columnBuilder,
    this.rowBuilder,
    this.rowSpanExtent,
    this.columnSpanExtent,
    this.rowSpanBackgroundDecoration,
    this.rowSpanForegroundDecoration,
    this.columnSpanBackgroundDecoration,
    this.columnSpanForegroundDecoration,
    this.onHoveredRowIndex,
    this.horizontalScrollController,
    this.verticalScrollController,
    this.pinnedRowCount,
    this.pinnedColumnCount,
    this.primary,
    this.diagonalDragBehavior,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.verticalScrollPhysics,
    this.horizontalScrollPhysics,
    this.onRowTap,
    this.onColumnTap,
    this.supportedDevices,
    this.onRowTapDown,
    this.onRowTapUp,
    this.onRowTapCancel,
    this.onRowSecondaryTap,
    this.onRowSecondaryTapDown,
    this.onRowSecondaryTapUp,
    this.onRowSecondaryTapCancel,
    this.onColumnTapDown,
    this.onColumnTapUp,
    this.onColumnTapCancel,
    this.onColumnSecondaryTap,
    this.onColumnSecondaryTapDown,
    this.onColumnSecondaryTapUp,
    this.onColumnSecondaryTapCancel,
  })  : builder = null,
        assert(children.isNotEmpty, 'children cannot be empty'),
        headerBuilder = null,
        footerBuilder = null,
        columnCount = children.elementAt(0).length,
        rowCount = children.length;

  final ShadTableCell Function(BuildContext context, int column)? headerBuilder;
  final ShadTableCell Function(BuildContext context, int column)? footerBuilder;
  final Iterable<ShadTableCell>? header;
  final Iterable<ShadTableCell>? footer;
  final ShadTableCellBuilder? builder;
  final int columnCount;
  final int rowCount;
  final Iterable<Iterable<ShadTableCell>>? children;
  final TableSpanBuilder? columnBuilder;
  final TableSpanBuilder? rowBuilder;
  final TableSpanExtent? Function(int row)? rowSpanExtent;
  final TableSpanExtent? Function(int column)? columnSpanExtent;
  final TableSpanDecoration? Function(int row)? rowSpanBackgroundDecoration;
  final TableSpanDecoration? Function(int row)? rowSpanForegroundDecoration;
  final TableSpanDecoration? Function(int column)?
      columnSpanBackgroundDecoration;
  final TableSpanDecoration? Function(int column)?
      columnSpanForegroundDecoration;
  final ValueChanged<int?>? onHoveredRowIndex;
  final ScrollController? verticalScrollController;
  final ScrollController? horizontalScrollController;
  final int? pinnedRowCount;
  final int? pinnedColumnCount;
  final bool? primary;
  final DiagonalDragBehavior? diagonalDragBehavior;
  final DragStartBehavior? dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final ScrollPhysics? verticalScrollPhysics;
  final ScrollPhysics? horizontalScrollPhysics;

  final void Function(int row)? onRowTap;
  final void Function(int row)? onRowTapDown;
  final void Function(int row)? onRowTapUp;
  final void Function(int row)? onRowTapCancel;
  final void Function(int row)? onRowSecondaryTap;
  final void Function(int row)? onRowSecondaryTapDown;
  final void Function(int row)? onRowSecondaryTapUp;
  final void Function(int row)? onRowSecondaryTapCancel;
  final void Function(int column)? onColumnTap;
  final void Function(int column)? onColumnTapDown;
  final void Function(int column)? onColumnTapUp;
  final void Function(int column)? onColumnTapCancel;
  final void Function(int column)? onColumnSecondaryTap;
  final void Function(int column)? onColumnSecondaryTapDown;
  final void Function(int column)? onColumnSecondaryTapUp;
  final void Function(int column)? onColumnSecondaryTapCancel;

  /// The kind of devices that are allowed to be recognized.
  ///
  /// If set to null, events from all device types will be recognized. Defaults
  /// to null.
  final Set<PointerDeviceKind>? supportedDevices;

  @override
  State<ShadTable> createState() => _ShadTableState();
}

class _ShadTableState extends State<ShadTable> {
  final hoveredRowIndex = ValueNotifier<int?>(null);

  /// This is a workaround to avoid rebuilding the same row when the pointer
  /// doesn't move, because when you call setState, the onExit callback is
  /// called, even if the pointer is still hovering, and the onEnter callback is
  /// called again, causing an infinite loop.
  Offset? previousPointerOffset;

  int get effectiveRowCount =>
      widget.rowCount +
      (widget.header != null || widget.headerBuilder != null ? 1 : 0) +
      (widget.footer != null || widget.footerBuilder != null ? 1 : 0);

  @override
  void initState() {
    super.initState();
    hoveredRowIndex.addListener(() {
      widget.onHoveredRowIndex?.call(hoveredRowIndex.value);
    });
  }

  @override
  void dispose() {
    hoveredRowIndex.dispose();
    super.dispose();
  }

  TableSpan _buildColumnSpan(int index) {
    final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);
    final requestedColumnSpanExtent = widget.columnSpanExtent?.call(index);
    final effectiveColumnSpanExtent =
        requestedColumnSpanExtent ?? const FixedTableSpanExtent(100);

    return TableSpan(
      extent: effectiveColumnSpanExtent,
      backgroundDecoration: widget.columnSpanBackgroundDecoration?.call(index),
      foregroundDecoration: widget.columnSpanForegroundDecoration?.call(index),
      recognizerFactories: {
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(
            debugOwner: this,
            supportedDevices: widget.supportedDevices,
          ),
          (TapGestureRecognizer instance) {
            if (widget.onColumnTap != null) {
              instance.onTap = () => widget.onColumnTap!(index);
            }
            if (widget.onColumnTapDown != null) {
              instance.onTapDown = (d) => widget.onColumnTapDown!(index);
            }
            if (widget.onColumnTapUp != null) {
              instance.onTapUp = (d) => widget.onColumnTapUp!(index);
            }
            if (widget.onColumnTapCancel != null) {
              instance.onTapCancel = () => widget.onColumnTapCancel!(index);
            }
            if (widget.onColumnSecondaryTap != null) {
              instance.onSecondaryTap =
                  () => widget.onColumnSecondaryTap!(index);
            }
            if (widget.onColumnSecondaryTapDown != null) {
              instance.onSecondaryTapDown =
                  (d) => widget.onColumnSecondaryTapDown!(index);
            }
            if (widget.onColumnSecondaryTapUp != null) {
              instance.onSecondaryTapUp =
                  (d) => widget.onColumnSecondaryTapUp!(index);
            }
            if (widget.onColumnSecondaryTapCancel != null) {
              instance.onSecondaryTapCancel =
                  () => widget.onColumnSecondaryTapCancel!(index);
            }

            instance
              ..gestureSettings = gestureSettings
              ..supportedDevices = widget.supportedDevices;
          },
        ),
      },
    );
  }

  TableSpan _buildRowSpan(int index, int effectiveRowCount) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);
    final isLast = index == effectiveRowCount - 1;
    final isFooter =
        isLast && (widget.footer != null || widget.footerBuilder != null);

    final requestedRowSpanExtent = widget.rowSpanExtent?.call(index);
    final effectiveRowSpanExtent =
        requestedRowSpanExtent ?? const FixedTableSpanExtent(48);

    return TableSpan(
      backgroundDecoration: widget.rowSpanBackgroundDecoration?.call(index) ??
          TableSpanDecoration(
            color: hoveredRowIndex.value == index
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
        previousPointerOffset = p.position;
        hoveredRowIndex.value = index;
      },
      onExit: (p) {
        if (previousPointerOffset == p.position) return;
        hoveredRowIndex.value = null;
      },
      recognizerFactories: {
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(
            debugOwner: this,
            supportedDevices: widget.supportedDevices,
          ),
          (TapGestureRecognizer instance) {
            if (widget.onRowTap != null) {
              instance.onTap = () => widget.onRowTap!(index);
            }
            if (widget.onRowTapDown != null) {
              instance.onTapDown = (d) => widget.onRowTapDown!(index);
            }
            if (widget.onRowTapUp != null) {
              instance.onTapUp = (d) => widget.onRowTapUp!(index);
            }
            if (widget.onRowTapCancel != null) {
              instance.onTapCancel = () => widget.onRowTapCancel!(index);
            }
            if (widget.onRowSecondaryTap != null) {
              instance.onSecondaryTap = () => widget.onRowSecondaryTap!(index);
            }
            if (widget.onRowSecondaryTapDown != null) {
              instance.onSecondaryTapDown =
                  (d) => widget.onRowSecondaryTapDown!(index);
            }
            if (widget.onRowSecondaryTapUp != null) {
              instance.onSecondaryTapUp =
                  (d) => widget.onRowSecondaryTapUp!(index);
            }
            if (widget.onRowSecondaryTapCancel != null) {
              instance.onSecondaryTapCancel =
                  () => widget.onRowSecondaryTapCancel!(index);
            }

            instance
              ..gestureSettings = gestureSettings
              ..supportedDevices = widget.supportedDevices;
          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveRowBuilder = widget.rowBuilder ??
        theme.tableTheme.rowBuilder ??
        (i) => _buildRowSpan(i, effectiveRowCount);

    final effectiveColumnBuilder = widget.columnBuilder ??
        theme.tableTheme.columnBuilder ??
        _buildColumnSpan;

    final effectivePinnedRowCount = widget.pinnedRowCount ?? 0;
    final effectivePinnedColumnCount = widget.pinnedColumnCount ?? 0;
    final effectivePrimary = widget.primary;

    final effectiveDiagonalDragBehavior = widget.diagonalDragBehavior ??
        theme.tableTheme.diagonalDragBehavior ??
        DiagonalDragBehavior.none;

    final effectiveDragStartBehavior = widget.dragStartBehavior ??
        theme.tableTheme.dragStartBehavior ??
        DragStartBehavior.start;

    final effectiveKeyboardDismissBehavior = widget.keyboardDismissBehavior ??
        theme.tableTheme.keyboardDismissBehavior ??
        ScrollViewKeyboardDismissBehavior.manual;

    return ValueListenableBuilder(
      valueListenable: hoveredRowIndex,
      builder: (context, value, child) {
        if (widget.children != null) {
          return TableView.list(
            primary: effectivePrimary,
            diagonalDragBehavior: effectiveDiagonalDragBehavior,
            dragStartBehavior: effectiveDragStartBehavior,
            keyboardDismissBehavior: effectiveKeyboardDismissBehavior,
            columnBuilder: effectiveColumnBuilder,
            rowBuilder: effectiveRowBuilder,
            verticalDetails: ScrollableDetails.vertical(
              controller: widget.verticalScrollController,
              physics: widget.verticalScrollPhysics,
            ),
            horizontalDetails: ScrollableDetails.horizontal(
              controller: widget.horizontalScrollController,
              physics: widget.horizontalScrollPhysics,
            ),
            cells: [
              if (widget.header != null) widget.header!.toList(),
              ...widget.children!.map((e) => e.toList()),
              if (widget.footer != null) widget.footer!.toList(),
            ],
            pinnedRowCount: effectivePinnedRowCount,
            pinnedColumnCount: effectivePinnedColumnCount,
          );
        }
        return TableView.builder(
          primary: effectivePrimary,
          diagonalDragBehavior: effectiveDiagonalDragBehavior,
          dragStartBehavior: effectiveDragStartBehavior,
          keyboardDismissBehavior: effectiveKeyboardDismissBehavior,
          verticalDetails: ScrollableDetails.vertical(
            controller: widget.verticalScrollController,
            physics: widget.verticalScrollPhysics,
          ),
          horizontalDetails: ScrollableDetails.horizontal(
            controller: widget.horizontalScrollController,
            physics: widget.horizontalScrollPhysics,
          ),
          cellBuilder: (context, index) {
            if (widget.headerBuilder != null && index.row == 0) {
              return widget.headerBuilder!(context, index.column);
            }
            if (widget.footerBuilder != null &&
                index.row == effectiveRowCount - 1) {
              return widget.footerBuilder!(context, index.column);
            }

            final realVicinity = TableVicinity(
              row: widget.headerBuilder != null ? index.row - 1 : index.row,
              column: index.column,
            );

            return widget.builder!(context, realVicinity);
          },
          columnCount: widget.columnCount,
          columnBuilder: effectiveColumnBuilder,
          rowCount: effectiveRowCount,
          rowBuilder: effectiveRowBuilder,
          pinnedRowCount: effectivePinnedRowCount,
          pinnedColumnCount: effectivePinnedColumnCount,
        );
      },
    );
  }
}
