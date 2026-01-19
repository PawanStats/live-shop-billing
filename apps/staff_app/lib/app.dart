import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'features/billing/billing_screen.dart';

class StaffApp extends StatelessWidget {
  const StaffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8338EC))),
      home: const BillingScreen(),
    );
  }
}
