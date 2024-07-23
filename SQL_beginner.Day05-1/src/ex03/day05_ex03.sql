CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date)

set enable_seqscan to off;
EXPLAIN ANALYZE

select person_id, menu_id, order_date
from person_order
where person_id = 8 and menu_id = 19;