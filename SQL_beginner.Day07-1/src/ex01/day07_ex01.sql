select p.name, count(pv.person_id) as count_of_visits
from person_visits pv
join person p on p.id = pv.person_id
group by person_id, p.name
order by count_of_visits desc , person_id
limit 4

