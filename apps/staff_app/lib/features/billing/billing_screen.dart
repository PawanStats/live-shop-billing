import 'package:flutter/material.dart';
import 'bill_summary.dart';
import 'complete_sale_button.dart';
import '../scanner/camera_scanner.dart';

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
      appBar: AppBar(
        title: const Text('Billing'),
        actions: [
          IconButton(
            tooltip: 'Scan Barcode',
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: _scanAndAdd,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: items.map((e) => ListTile(
                title: Text(e['name'] as String),
                trailing: Text('\$${(e['price'] as double).toStringAsFixed(2)} x ${e['qty']}'),
              )).toList(),
            ),
          ),
          BillSummary(total: total),
          CompleteSaleButton(onPressed: () {/* TODO: integrate Supabase */}),
        ],
      ),
    );
  }

  Future<void> _scanAndAdd() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const CameraScanner()),
    );
    if (code != null && code.isNotEmpty) {
      setState(() {
        items.add({
          'name': code,
          'price': 0.0,
          'qty': 1,
        });
      });
    }
  }
}
