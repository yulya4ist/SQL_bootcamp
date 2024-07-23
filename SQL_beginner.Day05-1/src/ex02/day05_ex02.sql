CREATE INDEX idx_person_name ON person (UPPER(name));

set enable_seqscan to off;

EXPLAIN ANALYZE
select name
from person
where upper(person.name) = 'ANNA'