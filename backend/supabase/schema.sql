-- Tables
create table if not exists items (
  id bigint generated always as identity primary key,
  sku text unique not null,
  name text not null,
  price numeric(10,2) not null default 0
);

create table if not exists inventory (
  item_id bigint primary key references items(id) on delete cascade,
  quantity integer not null default 0,
  updated_at timestamptz not null default now()
);

create table if not exists transactions (
  id uuid primary key default gen_random_uuid(),
  total numeric(10,2) not null,
  created_at timestamptz not null default now()
);

create table if not exists transaction_items (
  transaction_id uuid references transactions(id) on delete cascade,
  item_id bigint references items(id),
  qty integer not null,
  price numeric(10,2) not null,
  primary key (transaction_id, item_id)
);

create table if not exists activities (
  id bigint generated always as identity primary key,
  type text not null, -- 'sale' | 'stock' | 'alert'
  message text not null,
  created_at timestamptz not null default now()
);
