# Architecture

- Frontend: Flutter (Web for Owner, Mobile for Staff)
- Backend: Supabase (Postgres, Auth, Realtime)
- Data flow:
  - Staff posts `transactions` and `transaction_items`
  - Inventory updates maintain stock counts
  - Owner dashboard streams `activities` and analytics

## Modules
- Owner app: live feed, analytics, inventoryalerts
- Staff app: billing flow, scanner, sale completion

## Realtime
- `activities` table emits insert events for dashboard live feed

## Security
- RLS enabled. Authenticated role can write sales, public can read demo data.
