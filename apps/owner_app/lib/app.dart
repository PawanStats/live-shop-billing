import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/live_feed/live_feed_screen.dart';

class OwnerApp extends StatelessWidget {
  const OwnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Owner Dashboard',
      theme: AppTheme.light,
      home: const LiveFeedScreen(),
    );
  }
}
