import 'package:flutter/material.dart';
import 'live_feed_controller.dart';
import 'live_feed_tile.dart';

class LiveFeedScreen extends StatefulWidget {
  const LiveFeedScreen({super.key});

  @override
  State<LiveFeedScreen> createState() => _LiveFeedScreenState();
}

class _LiveFeedScreenState extends State<LiveFeedScreen> {
  final controller = LiveFeedController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Feed')),
      body: ListView.builder(
        itemCount: controller.activities.length,
        itemBuilder: (_, i) => LiveFeedTile(activity: controller.activities[i]),
      ),
    );
  }
}
