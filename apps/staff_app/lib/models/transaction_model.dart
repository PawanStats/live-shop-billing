class Transaction {
  final String id;
  final double amount;
  final DateTime createdAt;

  Transaction({required this.id, required this.amount, required this.createdAt});

  factory Transaction.fromMap(Map<String, dynamic> map) => Transaction(
    id: map['id'] as String,
    amount: (map['amount'] as num).toDouble(),
    createdAt: DateTime.parse(map['created_at'] as String),
  );
}
