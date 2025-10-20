import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

/// Builder function for creating [ShadTableCell] widgets.
typedef ShadTableCellBuilder =
    ShadTableCell Function(
      BuildContext context,
      TableVicinity vicinity,
    );

/// Enum representing different variants of [ShadTableCell].
enum ShadTableCellVariant {
  /// Variant for header cells.
  header,

  /// Variant for regular data cells.
  cell,

  /// Variant for footer cells.
  footer,
}

/// {@template ShadTableCell}
/// A cell widget for use within [ShadTable].
///
/// Provides styling and structure for table cells, including header and footer
/// variants.
/// {@endtemplate}
class ShadTableCell extends TableViewCell {
  /// {@macro ShadTableCell}
  const ShadTableCell({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.cell;

  /// Creates a [ShadTableCell] with the header variant.
  ///
  /// {@macro ShadTableCell}
  const ShadTableCell.header({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.header;

  /// Creates a [ShadTableCell] with the footer variant.
  ///
  /// {@macro ShadTableCell}
  const ShadTableCell.footer({
    super.key,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  }) : variant = ShadTableCellVariant.footer;

  /// Creates a [ShadTableCell] with a raw variant, allowing explicit variant
  /// specification.
  ///
  /// {@macro ShadTableCell}
  const ShadTableCell.raw({
    super.key,
    required this.variant,
    required super.child,
    this.alignment,
    this.height,
    this.padding,
    this.style,
  });

  /// {@template ShadTableCell.variant}
  /// The variant of the table cell, determining its styling.
  /// {@endtemplate}
  final ShadTableCellVariant variant;

  /// {@template ShadTableCell.alignment}
  /// Alignment of the cell's content.
  /// {@endtemplate}
  final AlignmentGeometry? alignment;

  /// {@template ShadTableCell.height}
  /// Height of the table cell.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadTableCell.padding}
  /// Padding within the table cell.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTableCell.style}
  /// Text style for the cell's content.
  /// {@endtemplate}
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlignment =
        alignment ??
        theme.tableTheme.cellAlignment ??
        AlignmentDirectional.centerStart;

    final effectiveHeight = height ?? theme.tableTheme.cellHeight ?? 48;

    final effectivePadding =
        padding ??
        theme.tableTheme.cellPadding ??
        const EdgeInsets.symmetric(horizontal: 16);

    final textStyle =
        style ??
        switch (variant) {
          ShadTableCellVariant.cell =>
            (theme.tableTheme.cellStyle ?? theme.textTheme.muted).fallback(
              color: theme.colorScheme.foreground,
            ),
          ShadTableCellVariant.header =>
            (theme.tableTheme.cellHeaderStyle ??
                    theme.textTheme.muted.copyWith(fontWeight: FontWeight.w500))
                .fallback(color: theme.colorScheme.foreground),
          ShadTableCellVariant.footer =>
            (theme.tableTheme.cellFooterStyle ??
                    theme.textTheme.muted.copyWith(fontWeight: FontWeight.w500))
                .fallback(color: theme.colorScheme.foreground),
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

/// {@template ShadTable}
/// A customizable table widget for displaying tabular data.
///
/// Supports on-demand cell building, fixed lists of cells, headers, footers,
/// and various interactions.
/// {@endtemplate}
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
  }) : children = null,
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
  }) : builder = null,
       assert(children.isNotEmpty, 'children cannot be empty'),
       headerBuilder = null,
       footerBuilder = null,
       columnCount = children.elementAt(0).length,
       rowCount = children.length;

  /// {@template ShadTable.headerBuilder}
  /// Builder function for creating header cells.
  /// {@endtemplate}
  final ShadTableCell Function(BuildContext context, int column)? headerBuilder;

  /// {@template ShadTable.footerBuilder}
  /// Builder function for creating footer cells.
  /// {@endtemplate}
  final ShadTableCell Function(BuildContext context, int column)? footerBuilder;

  /// {@template ShadTable.header}
  /// Explicit list of header cells.
  /// {@endtemplate}
  final Iterable<ShadTableCell>? header;

  /// {@template ShadTable.footer}
  /// Explicit list of footer cells.
  /// {@endtemplate}
  final Iterable<ShadTableCell>? footer;

  /// {@template ShadTable.builder}
  /// Builder function for creating table cells on demand.
  /// {@endtemplate}
  final ShadTableCellBuilder? builder;

  /// {@template ShadTable.columnCount}
  /// Number of columns in the table.
  /// {@endtemplate}
  final int columnCount;

  /// {@template ShadTable.rowCount}
  /// Number of rows in the table (excluding header and footer).
  /// {@endtemplate}
  final int rowCount;

  /// {@template ShadTable.children}
  /// Explicit 2D list of [ShadTableCell] widgets.
  /// {@endtemplate}
  final Iterable<Iterable<ShadTableCell>>? children;

  /// {@template ShadTable.columnBuilder}
  /// Builder for defining column properties.
  /// {@endtemplate}
  final TableSpanBuilder? columnBuilder;

  /// {@template ShadTable.rowBuilder}
  /// Builder for defining row properties.
  /// {@endtemplate}
  final TableSpanBuilder? rowBuilder;

  /// {@template ShadTable.rowSpanExtent}
  /// Function to define custom row span extents.
  /// {@endtemplate}
  final TableSpanExtent? Function(int row)? rowSpanExtent;

  /// {@template ShadTable.columnSpanExtent}
  /// Function to define custom column span extents.
  /// {@endtemplate}
  final TableSpanExtent? Function(int column)? columnSpanExtent;

  /// {@template ShadTable.rowSpanBackgroundDecoration}
  /// Function to define background decoration for rows.
  /// {@endtemplate}
  final TableSpanDecoration? Function(int row)? rowSpanBackgroundDecoration;

  /// {@template ShadTable.rowSpanForegroundDecoration}
  /// Function to define foreground decoration for rows.
  /// {@endtemplate}
  final TableSpanDecoration? Function(int row)? rowSpanForegroundDecoration;

  /// {@template ShadTable.columnSpanBackgroundDecoration}
  /// Function to define background decoration for columns.
  /// {@endtemplate}
  final TableSpanDecoration? Function(int column)?
  columnSpanBackgroundDecoration;

  /// {@template ShadTable.columnSpanForegroundDecoration}
  /// Function to define foreground decoration for columns.
  /// {@endtemplate}
  final TableSpanDecoration? Function(int column)?
  columnSpanForegroundDecoration;

  /// {@template ShadTable.onHoveredRowIndex}
  /// Callback for when a row is hovered, providing the row index.
  /// {@endtemplate}
  final ValueChanged<int?>? onHoveredRowIndex;

  /// {@template ShadTable.verticalScrollController}
  /// Controller for vertical scrolling.
  /// {@endtemplate}
  final ScrollController? verticalScrollController;

  /// {@template ShadTable.horizontalScrollController}
  /// Controller for horizontal scrolling.
  /// {@endtemplate}
  final ScrollController? horizontalScrollController;

  /// {@template ShadTable.pinnedRowCount}
  /// Number of pinned rows at the top.
  /// {@endtemplate}
  final int? pinnedRowCount;

  /// {@template ShadTable.pinnedColumnCount}
  /// Number of pinned columns at the start.
  /// {@endtemplate}
  final int? pinnedColumnCount;

  /// {@template ShadTable.primary}
  /// Whether this is the primary scroll view.
  /// {@endtemplate}
  final bool? primary;

  /// {@template ShadTable.diagonalDragBehavior}
  /// Drag behavior when dragging diagonally.
  /// {@endtemplate}
  final DiagonalDragBehavior? diagonalDragBehavior;

  /// {@template ShadTable.dragStartBehavior}
  /// Determines when a drag formally starts.
  /// {@endtemplate}
  final DragStartBehavior? dragStartBehavior;

  /// {@template ShadTable.keyboardDismissBehavior}
  /// Configures how the keyboard is dismissed when a drag starts.
  /// {@endtemplate}
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  /// {@template ShadTable.verticalScrollPhysics}
  /// Physics for vertical scrolling.
  /// {@endtemplate}
  final ScrollPhysics? verticalScrollPhysics;

  /// {@template ShadTable.horizontalScrollPhysics}
  /// Physics for horizontal scrolling.
  /// {@endtemplate}
  final ScrollPhysics? horizontalScrollPhysics;

  /// {@template ShadTable.onRowTap}
  /// Callback for tap gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowTap;

  /// {@template ShadTable.onRowTapDown}
  /// Callback for tap down gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowTapDown;

  /// {@template ShadTable.onRowTapUp}
  /// Callback for tap up gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowTapUp;

  /// {@template ShadTable.onRowTapCancel}
  /// Callback for tap cancel gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowTapCancel;

  /// {@template ShadTable.onRowSecondaryTap}
  /// Callback for secondary tap gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowSecondaryTap;

  /// {@template ShadTable.onRowSecondaryTapDown}
  /// Callback for secondary tap down gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowSecondaryTapDown;

  /// {@template ShadTable.onRowSecondaryTapUp}
  /// Callback for secondary tap up gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowSecondaryTapUp;

  /// {@template ShadTable.onRowSecondaryTapCancel}
  /// Callback for secondary tap cancel gestures on a row.
  /// {@endtemplate}
  final void Function(int row)? onRowSecondaryTapCancel;

  /// {@template ShadTable.onColumnTap}
  /// Callback for tap gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnTap;

  /// {@template ShadTable.onColumnTapDown}
  /// Callback for tap down gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnTapDown;

  /// {@template ShadTable.onColumnTapUp}
  /// Callback for tap up gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnTapUp;

  /// {@template ShadTable.onColumnTapCancel}
  /// Callback for tap cancel gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnTapCancel;

  /// {@template ShadTable.onColumnSecondaryTap}
  /// Callback for secondary tap gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnSecondaryTap;

  /// {@template ShadTable.onColumnSecondaryTapDown}
  /// Callback for secondary tap down gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnSecondaryTapDown;

  /// {@template ShadTable.onColumnSecondaryTapUp}
  /// Callback for secondary tap up gestures on a column.
  /// {@endtemplate}
  final void Function(int column)? onColumnSecondaryTapUp;

  /// {@template ShadTable.onColumnSecondaryTapCancel}
  /// Callback for secondary tap cancel gestures on a column.
  /// {@endtemplate}
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
                  instance.onSecondaryTap = () =>
                      widget.onColumnSecondaryTap!(index);
                }
                if (widget.onColumnSecondaryTapDown != null) {
                  instance.onSecondaryTapDown = (d) =>
                      widget.onColumnSecondaryTapDown!(index);
                }
                if (widget.onColumnSecondaryTapUp != null) {
                  instance.onSecondaryTapUp = (d) =>
                      widget.onColumnSecondaryTapUp!(index);
                }
                if (widget.onColumnSecondaryTapCancel != null) {
                  instance.onSecondaryTapCancel = () =>
                      widget.onColumnSecondaryTapCancel!(index);
                }

                instance
                  ..gestureSettings = gestureSettings
                  ..supportedDevices = widget.supportedDevices;
              },
            ),
      },
      cursor: widget.onColumnTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
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
      backgroundDecoration:
          widget.rowSpanBackgroundDecoration?.call(index) ??
          TableSpanDecoration(
            color: hoveredRowIndex.value == index
                ? colorScheme.muted.withValues(alpha: isFooter ? 1 : .5)
                : isFooter
                ? colorScheme.muted.withValues(alpha: .5)
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
        if (!mounted) return;
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
                  instance.onSecondaryTap = () =>
                      widget.onRowSecondaryTap!(index);
                }
                if (widget.onRowSecondaryTapDown != null) {
                  instance.onSecondaryTapDown = (d) =>
                      widget.onRowSecondaryTapDown!(index);
                }
                if (widget.onRowSecondaryTapUp != null) {
                  instance.onSecondaryTapUp = (d) =>
                      widget.onRowSecondaryTapUp!(index);
                }
                if (widget.onRowSecondaryTapCancel != null) {
                  instance.onSecondaryTapCancel = () =>
                      widget.onRowSecondaryTapCancel!(index);
                }

                instance
                  ..gestureSettings = gestureSettings
                  ..supportedDevices = widget.supportedDevices;
              },
            ),
      },
      cursor: widget.onRowTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveRowBuilder =
        widget.rowBuilder ??
        theme.tableTheme.rowBuilder ??
        (i) => _buildRowSpan(i, effectiveRowCount);

    final effectiveColumnBuilder =
        widget.columnBuilder ??
        theme.tableTheme.columnBuilder ??
        _buildColumnSpan;

    final effectivePinnedRowCount = widget.pinnedRowCount ?? 0;
    final effectivePinnedColumnCount = widget.pinnedColumnCount ?? 0;
    final effectivePrimary = widget.primary;

    final effectiveDiagonalDragBehavior =
        widget.diagonalDragBehavior ??
        theme.tableTheme.diagonalDragBehavior ??
        DiagonalDragBehavior.none;

    final effectiveDragStartBehavior =
        widget.dragStartBehavior ??
        theme.tableTheme.dragStartBehavior ??
        DragStartBehavior.start;

    final effectiveKeyboardDismissBehavior =
        widget.keyboardDismissBehavior ??
        theme.tableTheme.keyboardDismissBehavior ??
        ScrollViewKeyboardDismissBehavior.manual;

    final textDirection = Directionality.of(context);

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
              reverse: textDirection == TextDirection.rtl,
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
            reverse: textDirection == TextDirection.rtl,
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
