import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/supabase_client.dart';
import '../../models/activity_model.dart';
import 'live_feed_tile.dart';

class LiveFeedScreen extends StatelessWidget {
  const LiveFeedScreen({super.key});

  Stream<List<Activity>> _activityStream() {
    final stream = SupabaseService.client
        .from('activity_feed')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false);
    return stream.map((rows) => rows.map(Activity.fromMap).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Activity Feed')),
      body: StreamBuilder<List<Activity>>(
        stream: _activityStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading activity'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final activities = snapshot.data!;
          if (activities.isEmpty) {
            return const Center(child: Text('No activity yet'));
          }
          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, i) => LiveFeedTile(activity: activities[i]),
          );
        },
      ),
    );
  }
}
