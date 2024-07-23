create unique index idx_menu_unique ON menu(pizzeria_id, pizza_name);

set enable_seqscan to off;
EXPLAIN ANALYZE

select menu.pizzeria_id, menu.pizza_name
from menu;

-- delete from menu
--     where id = 21;
--
--
-- select *
-- from menu