-- Row Level Security Policies
alter table items enable row level security;
alter table inventory enable row level security;
alter table transactions enable row level security;
alter table transaction_items enable row level security;
alter table activities enable row level security;

-- Public read for demo, tighten in production
create policy "Public read items" on items for select using ( true );
create policy "Public read inventory" on inventory for select using ( true );

create policy "Insert transactions authenticated" on transactions
  for insert to authenticated using ( true ) with check ( true );
create policy "Select transactions for all" on transactions for select using ( true );

create policy "Insert transaction_items authenticated" on transaction_items
  for insert to authenticated using ( true ) with check ( true );

create policy "Insert activities authenticated" on activities
  for insert to authenticated using ( true ) with check ( true );
create policy "Select activities for all" on activities for select using ( true );
