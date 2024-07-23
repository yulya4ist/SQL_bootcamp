create unique index idx_person_discounts_unique on person_discounts (person_id, pizzeria_id);

set enable_seqscan to off;
explain analyse

select *
from person_discounts
where pizzeria_id = 1 and person_id = 7