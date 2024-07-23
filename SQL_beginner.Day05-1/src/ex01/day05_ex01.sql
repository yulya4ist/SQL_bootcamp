set enable_seqscan to off;

EXPLAIN ANALYZE
select menu.pizza_name, piz.name as pizzeria_name
from pizzeria piz
join menu on menu.pizzeria_id= piz.id