import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/table.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../extra/pump_async_widget.dart';

const invoices = [
  (
    invoice: 'INV001',
    paymentStatus: 'Paid',
    totalAmount: r'$250.00',
    paymentMethod: 'Credit Card',
  ),
  (
    invoice: 'INV002',
    paymentStatus: 'Pending',
    totalAmount: r'$150.00',
    paymentMethod: 'PayPal',
  ),
  (
    invoice: 'INV003',
    paymentStatus: 'Unpaid',
    totalAmount: r'$350.00',
    paymentMethod: 'Bank Transfer',
  ),
  (
    invoice: 'INV004',
    paymentStatus: 'Paid',
    totalAmount: r'$450.00',
    paymentMethod: 'Credit Card',
  ),
  (
    invoice: 'INV005',
    paymentStatus: 'Paid',
    totalAmount: r'$550.00',
    paymentMethod: 'PayPal',
  ),
  (
    invoice: 'INV006',
    paymentStatus: 'Pending',
    totalAmount: r'$200.00',
    paymentMethod: 'Bank Transfer',
  ),
  (
    invoice: 'INV007',
    paymentStatus: 'Unpaid',
    totalAmount: r'$300.00',
    paymentMethod: 'Credit Card',
  ),
];
void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadTable', () {
    testWidgets('ShadTable matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadTable.list(
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
      );

      expect(
        find.byType(ShadTable),
        matchesGoldenFile('goldens/table.png'),
      );
    });
  });
}
