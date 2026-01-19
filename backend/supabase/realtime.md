# Supabase Realtime Setup

Enable realtime on tables you want to stream (e.g. `activities`, `transactions`).

1. In Supabase, go to Database > Replication > Realtime.
2. Add tables: `activities`, `transactions`.
3. Client side:
   - Connect to channel: `client.channel('realtime:public:activities')`
   - Listen to `postgres_changes` with `event: 'INSERT'`.

Example Dart snippet (pseudo):

```dart
final channel = Supabase.instance.client
  .channel('realtime:public:activities')
  .onPostgresChange(
    event: PostgresChangeEvent.insert,
    schema: 'public',
    table: 'activities',
    callback: (payload) {
      // update UI
    },
  )
  .subscribe();
```
