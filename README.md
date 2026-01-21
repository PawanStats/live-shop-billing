# Live Shop Billing Monorepo

A two-app Flutter + Supabase monorepo:
- Owner Dashboard (Flutter Web + Mobile)
- Staff Billing Terminal (Flutter Mobile)

## Prerequisites
- Flutter SDK (3.3+)
- A Supabase project (URL + anon key)

## Quick Start

### Owner App (Web)
1. Install deps
2. Run with `dart-define` for Supabase

```powershell
cd apps/owner_app
flutter pub get
flutter run -d chrome --dart-define SUPABASE_URL="https://YOUR-PROJECT.supabase.co" --dart-define SUPABASE_ANON_KEY="YOUR-ANON-KEY"
```

Entry points: [apps/owner_app/lib/main.dart](apps/owner_app/lib/main.dart), [apps/owner_app/lib/app.dart](apps/owner_app/lib/app.dart)

### Staff App (Mobile)
Use an Android emulator or a connected device.

```powershell
cd apps/staff_app
flutter pub get
flutter run --dart-define SUPABASE_URL="https://YOUR-PROJECT.supabase.co" --dart-define SUPABASE_ANON_KEY="YOUR-ANON-KEY"
```

Entry points: [apps/staff_app/lib/main.dart](apps/staff_app/lib/main.dart), [apps/staff_app/lib/app.dart](apps/staff_app/lib/app.dart)

## Supabase Setup
- Apply schema/policies/seed from [backend/supabase](backend/supabase):
	- [schema.sql](backend/supabase/schema.sql)
	- [policies.sql](backend/supabase/policies.sql)
	- [seed.sql](backend/supabase/seed.sql)
- Enable Realtime: see [realtime.md](backend/supabase/realtime.md)

Example using Supabase SQL editor:
1. Paste `schema.sql` and run
2. Paste `policies.sql` and run
3. Paste `seed.sql` and run

## Repo Layout
- Apps
	- Owner: live feed, analytics, inventory
		- Live feed: [apps/owner_app/lib/features/live_feed](apps/owner_app/lib/features/live_feed)
		- Analytics: [apps/owner_app/lib/features/analytics/sales_chart.dart](apps/owner_app/lib/features/analytics/sales_chart.dart)
		- Inventory: [apps/owner_app/lib/features/inventory/stock_alert_card.dart](apps/owner_app/lib/features/inventory/stock_alert_card.dart)
	- Staff: billing, scanner
		- Billing: [apps/staff_app/lib/features/billing](apps/staff_app/lib/features/billing)
		- Scanner: [apps/staff_app/lib/features/scanner/camera_scanner.dart](apps/staff_app/lib/features/scanner/camera_scanner.dart)

## Docs
- Architecture: [docs/architecture.md](docs/architecture.md)
- Wireframes: [docs/ui-wireframes.md](docs/ui-wireframes.md)
- Demo script: [docs/demo-script.md](docs/demo-script.md)
- Problem statement: [docs/problem-statement.md](docs/problem-statement.md)

## Notes
- Supabase is initialized via `dart-define` in both apps; see `main.dart` files.
- Asset placeholders live in [assets](assets). Add icons/images as needed.
