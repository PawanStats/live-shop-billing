import 'package:flutter/material.dart';

class BillSummary extends StatelessWidget {
  final double total;
  const BillSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Total'),
      trailing: Text('\$${total.toStringAsFixed(2)}'),
    );
  }
}
