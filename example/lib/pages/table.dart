import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Table',
      children: [
        ShadTable(
          header: const [
            ShadTableCell(child: Text('Invoice')),
            ShadTableCell(child: Text('Status')),
            ShadTableCell(child: Text('Method')),
            ShadTableCell(
              alignment: Alignment.centerRight,
              child: Text('Amount'),
            ),
          ],
          footer: const [
            ShadTableCell(child: Text('Total')),
            ShadTableCell(child: Text('')),
            ShadTableCell(child: Text('')),
            ShadTableCell(
              alignment: Alignment.centerRight,
              child: Text(r'$2500.00'),
            ),
          ],
          caption: const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('A list of your recent invoices.'),
          ),
          children: invoices
              .map(
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
              )
              .toList(),
        ),
      ],
    );
  }
}
