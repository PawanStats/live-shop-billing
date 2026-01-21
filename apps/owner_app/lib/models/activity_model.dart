class Activity {
  final int id;
  final String type;
  final String message;
  final DateTime timestamp;

  Activity({
    required this.id,
    required this.type,
    required this.message,
    required this.timestamp,
  });

  factory Activity.fromMap(Map<String, dynamic> map) => Activity(
        id: (map['id'] as num).toInt(),
        type: map['type'] as String,
        message: map['message'] as String,
        timestamp: DateTime.parse(map['created_at'] as String),
      );
}
