import 'package:flutter/material.dart';
import 'bill_summary.dart';
import 'complete_sale_button.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final items = <Map<String, dynamic>>[
    {'name': 'Item A', 'price': 9.99, 'qty': 1},
  ];

  double get total => items.fold(0.0, (sum, e) => sum + (e['price'] as double) * (e['qty'] as int));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Billing')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: items.map((e) => ListTile(
                title: Text(e['name'] as String),
                trailing: Text('\\$${(e['price'] as double).toStringAsFixed(2)} x ${e['qty']}'),
              )).toList(),
            ),
          ),
          BillSummary(total: total),
          CompleteSaleButton(onPressed: () {/* TODO: integrate Supabase */}),
        ],
      ),
    );
  }
}
