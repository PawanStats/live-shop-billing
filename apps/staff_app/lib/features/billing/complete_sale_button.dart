import 'package:flutter/material.dart';

class CompleteSaleButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CompleteSaleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.check),
        label: const Text('Complete Sale'),
      ),
    );
  }
}
