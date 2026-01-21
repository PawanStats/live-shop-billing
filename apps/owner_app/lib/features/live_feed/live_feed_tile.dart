import 'package:flutter/material.dart';
import '../../models/activity_model.dart';

class LiveFeedTile extends StatelessWidget {
  final Activity activity;
  const LiveFeedTile({super.key, required this.activity});

  IconData _iconForType(String type) {
    switch (type) {
      case 'sale':
        return Icons.receipt_long;
      case 'alert':
        return Icons.warning_amber_rounded;
      case 'open':
        return Icons.check_circle;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localTime = activity.timestamp.toLocal();
    final date = MaterialLocalizations.of(context).formatShortDate(localTime);
    final time = TimeOfDay.fromDateTime(localTime).format(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(_iconForType(activity.type)),
        title: Text(activity.message),
        subtitle: Text('$date • $time'),
      ),
    );
  }
}
