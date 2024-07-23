select distinct person.name
from person
join public.person_order po on person.id = po.person_id
order by name;
