import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const invoices = [
  [
    "INV001",
    "Paid",
    "Credit Card",
    r"$250.00",
  ],
  [
    "INV002",
    "Pending",
    "PayPal",
    r"$150.00",
  ],
  [
    "INV003",
    "Unpaid",
    "Bank Transfer",
    r"$350.00",
  ],
  [
    "INV004",
    "Paid",
    "Credit Card",
    r"$450.00",
  ],
  [
    "INV005",
    "Paid",
    "PayPal",
    r"$550.00",
  ],
  [
    "INV006",
    "Pending",
    "Bank Transfer",
    r"$200.00",
  ],
  [
    "INV007",
    "Unpaid",
    "Credit Card",
    r"$300.00",
  ],
];

final headings = [
  'Invoice',
  'Status',
  'Method',
  'Amount',
];

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final horizontalScrollController = ScrollController();
  final verticalScrollController = ScrollController();

  @override
  void dispose() {
    horizontalScrollController.dispose();
    verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Table',
      wrapChildrenInScrollable: false,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 600,
              // this is needed to prevent the table to overflow the screen
              // when the table is too big
              maxHeight: MediaQuery.sizeOf(context).height - kToolbarHeight,
            ),
            child: Scrollbar(
              controller: verticalScrollController,
              child: Scrollbar(
                controller: horizontalScrollController,
                child: ShadTable(
                  horizontalScrollController: horizontalScrollController,
                  verticalScrollController: verticalScrollController,
                  columnCount: invoices[0].length,
                  rowCount: invoices.length,
                  header: (context, column) {
                    final isLast = column == headings.length - 1;
                    return ShadTableCell.header(
                      alignment: isLast ? Alignment.centerRight : null,
                      child: Text(headings[column]),
                    );
                  },
                  columnSpanExtent: (index) {
                    if (index == 2) return const FixedTableSpanExtent(150);
                    if (index == 3) {
                      return const MaxTableSpanExtent(
                        FixedTableSpanExtent(120),
                        RemainingTableSpanExtent(),
                      );
                    }
                    return null;
                  },
                  builder: (context, index) {
                    final invoice = invoices[index.row];
                    return ShadTableCell(
                      alignment: index.column == invoice.length - 1
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        invoice[index.column],
                        style: index.column == 0
                            ? const TextStyle(fontWeight: FontWeight.w500)
                            : null,
                      ),
                    );
                  },
                  footer: (context, column) {
                    if (column == 0) {
                      return const ShadTableCell.footer(
                        child: Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    }
                    if (column == 3) {
                      return const ShadTableCell.footer(
                        alignment: Alignment.centerRight,
                        child: Text(
                          r'$2500.00',
                        ),
                      );
                    }
                    return const ShadTableCell(child: SizedBox());
                  },
                  caption: const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('A list of your recent invoices.'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
