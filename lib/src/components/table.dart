import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

class ShadTableCell extends StatefulWidget {
  const ShadTableCell({
    super.key,
    required this.child,
    this.alignment,
    this.height,
    this.padding,
  });

  final Alignment? alignment;
  final double? height;
  final Widget child;
  final EdgeInsets? padding;

  @override
  State<ShadTableCell> createState() => _ShadTableCellState();
}

class _ShadTableCellState extends State<ShadTableCell> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlignment = widget.alignment
        // ?? theme.tableCellTheme.alignment
        ??
        Alignment.centerLeft;

    final effectiveHeight = widget.height
        //?? theme.tableCellTheme.height
        ??
        48;

    final effectivePadding = widget.padding
        // ?? theme.tableCellTheme.padding
        ??
        const EdgeInsets.symmetric(horizontal: 16);

    return TableCell(
      child: Container(
        height: effectiveHeight,
        alignment: effectiveAlignment,
        padding: effectivePadding,
        child: widget.child,
      ),
    );
  }
}

class ShadTable extends StatefulWidget {
  const ShadTable({
    super.key,
    required this.children,
    this.header,
    this.footer,
    this.caption,
    this.headerDecoration,
    this.footerDecoration,
    this.rowsDecoration,
  });

  final Iterable<Iterable<Widget>> children;
  final Decoration? rowsDecoration;
  final Iterable<Widget>? header;
  final Decoration? headerDecoration;
  final Iterable<Widget>? footer;
  final Decoration? footerDecoration;
  final Widget? caption;

  @override
  State<ShadTable> createState() => _ShadTableState();
}

class _ShadTableState extends State<ShadTable> {
  final hoveredIndex = ValueNotifier<int>(-1);

  @override
  void dispose() {
    hoveredIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveFooterDecoration = widget.footerDecoration
        //?? theme.tableTheme.footerDecoration
        ??
        BoxDecoration(
          color: theme.colorScheme.muted.withOpacity(.5),
        );

    final effectiveRowsDecoration = widget.rowsDecoration
        //?? theme.tableTheme.rowsDecoration
        ??
        BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.colorScheme.border),
          ),
        );
    Widget table = ValueListenableBuilder(
      valueListenable: hoveredIndex,
      builder: (context, index, child) {
        final effectiveHeaderDecoration = widget.headerDecoration
            //?? theme.tableTheme.headerDecoration
            ??
            BoxDecoration(
              color: index == 0 ? theme.colorScheme.muted : null,
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.border),
              ),
            );

        return Table(
          children: [
            if (widget.header != null)
              TableRow(
                decoration: effectiveHeaderDecoration,
                children: widget.header!
                    .map(
                      (e) => MouseRegion(
                        onEnter: (_) => hoveredIndex.value = 0,
                        onExit: (_) {
                          if (hoveredIndex.value == 0) {
                            hoveredIndex.value = -1;
                          }
                        },
                        child: DefaultTextStyle(
                          style: theme.textTheme.muted,
                          textAlign: TextAlign.start,
                          child: e,
                        ),
                      ),
                    )
                    .toList(),
              ),

            // .map(
            //   (h) => TableCell(
            //     child: Container(
            //       height: 48,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           bottom: BorderSide(color: theme.colorScheme.border),
            //         ),
            //         // color: Colors.blue,
            //       ),
            //       alignment: Alignment.centerLeft,
            //       padding: const EdgeInsets.symmetric(horizontal: 16),
            //       child: DefaultTextStyle(
            //         style: theme.textTheme.muted,
            //         child: h,
            //       ),
            //     ),
            //   ),
            // )
            // .toList(),
            for (final (index, children) in widget.children.indexed)
              TableRow(
                decoration: effectiveRowsDecoration,
                children: children
                    .map(
                      (e) => MouseRegion(
                        onEnter: (_) => hoveredIndex.value = index + 1,
                        onExit: (_) {
                          if (hoveredIndex.value == index + 1) {
                            hoveredIndex.value = -1;
                          }
                        },
                        child: DefaultTextStyle(
                          style: theme.textTheme.muted.copyWith(
                            color: theme.colorScheme.foreground,
                          ),
                          child: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            if (widget.footer != null)
              TableRow(
                decoration: effectiveFooterDecoration,
                children: widget.footer!
                    .map(
                      (e) => DefaultTextStyle(
                        style: theme.textTheme.muted.copyWith(
                          color: theme.colorScheme.foreground,
                          fontWeight: FontWeight.w500,
                        ),
                        child: e,
                      ),
                    )
                    .toList(),
              ),
          ],
        );
      },
    );

    if (widget.caption != null) {
      table = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          table,
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
}
