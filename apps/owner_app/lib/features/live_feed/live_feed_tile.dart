import 'package:flutter/material.dart';
import '../../models/activity_model.dart';

class LiveFeedTile extends StatelessWidget {
  final Activity activity;
  const LiveFeedTile({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.receipt_long),
      title: Text(activity.message),
      subtitle: Text('${activity.type} • ${activity.timestamp}'),
    );
  }
}
