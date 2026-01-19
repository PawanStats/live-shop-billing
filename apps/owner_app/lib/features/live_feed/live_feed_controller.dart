import '../../models/activity_model.dart';

class LiveFeedController {
  final List<Activity> activities = [
    Activity(id: 1, type: 'sale', message: 'Sold item #123', timestamp: DateTime.now()),
  ];
}
