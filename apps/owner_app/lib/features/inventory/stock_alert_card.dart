import 'package:flutter/material.dart';

class StockAlertCard extends StatelessWidget {
  final String itemName;
  final int remaining;
  const StockAlertCard({super.key, required this.itemName, required this.remaining});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(itemName),
        trailing: Text('Left: $remaining'),
      ),
    );
  }
}
