-- Sample data for quick demos
insert into items (sku, name, price) values
 ('SKU-001','Item A',9.99),
 ('SKU-002','Item B',14.50)
on conflict (sku) do nothing;

insert into inventory (item_id, quantity)
select id, case sku when 'SKU-001' then 25 when 'SKU-002' then 10 end
from items
on conflict (item_id) do update set quantity = excluded.quantity;

-- One transaction
insert into transactions (total) values (9.99);

insert into transaction_items (transaction_id, item_id, qty, price)
select t.id, i.id, 1, i.price
from transactions t join items i on i.sku='SKU-001'
limit 1
on conflict do nothing;

insert into activities (type, message) values
('sale','Sold Item A'),
('stock','Restocked Item B')
on conflict do nothing;
