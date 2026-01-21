# Owner App

Flutter web/mobile dashboard for live shop monitoring.

## Run (Web)
```powershell
cd apps/owner_app
flutter pub get
flutter run -d chrome --dart-define SUPABASE_URL="https://YOUR-PROJECT.supabase.co" --dart-define SUPABASE_ANON_KEY="YOUR-ANON-KEY"
```

Main files: [lib/main.dart](lib/main.dart), [lib/app.dart](lib/app.dart)
