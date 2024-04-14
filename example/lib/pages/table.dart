import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const invoices = [
  (
    invoice: "INV001",
    paymentStatus: "Paid",
    totalAmount: r"$250.00",
    paymentMethod: "Credit Card",
  ),
  (
    invoice: "INV002",
    paymentStatus: "Pending",
    totalAmount: r"$150.00",
    paymentMethod: "PayPal",
  ),
  (
    invoice: "INV003",
    paymentStatus: "Unpaid",
    totalAmount: r"$350.00",
    paymentMethod: "Bank Transfer",
  ),
  (
    invoice: "INV004",
    paymentStatus: "Paid",
    totalAmount: r"$450.00",
    paymentMethod: "Credit Card",
  ),
  (
    invoice: "INV005",
    paymentStatus: "Paid",
    totalAmount: r"$550.00",
    paymentMethod: "PayPal",
  ),
  (
    invoice: "INV006",
    paymentStatus: "Pending",
    totalAmount: r"$200.00",
    paymentMethod: "Bank Transfer",
  ),
  (
    invoice: "INV007",
    paymentStatus: "Unpaid",
    totalAmount: r"$300.00",
    paymentMethod: "Credit Card",
  ),
];

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Table',
      wrapChildrenInScrollable: false,
      wrapSingleChildInColumn: false,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ShadTable.list(
              header: const [
                ShadTableCell.header(child: Text('Invoice')),
                ShadTableCell.header(child: Text('Status')),
                ShadTableCell.header(child: Text('Method')),
                ShadTableCell.header(
                  alignment: Alignment.centerRight,
                  child: Text('Amount'),
                ),
              ],
              footer: const [
                ShadTableCell.footer(child: Text('Total')),
                ShadTableCell.footer(child: Text('')),
                ShadTableCell.footer(child: Text('')),
                ShadTableCell.footer(
                  alignment: Alignment.centerRight,
                  child: Text(r'$2500.00'),
                ),
              ],
              columnSpanExtent: (index) {
                if (index == 2) return const FixedTableSpanExtent(130);
                if (index == 3) {
                  return const MaxTableSpanExtent(
                    FixedTableSpanExtent(120),
                    RemainingTableSpanExtent(),
                  );
                }
                // uses the default value
                return null;
              },
              children: invoices.map(
                (invoice) => [
                  ShadTableCell(
                    child: Text(
                      invoice.invoice,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ShadTableCell(child: Text(invoice.paymentStatus)),
                  ShadTableCell(child: Text(invoice.paymentMethod)),
                  ShadTableCell(
                    alignment: Alignment.centerRight,
                    child: Text(
                      invoice.totalAmount,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


/* With builder it will be
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

ShadTable(
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
)
*/
