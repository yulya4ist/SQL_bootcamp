Select id from person_visits
WHERE (person_visits.visit_date between '2022-01-06' and '2022-01-09') or (person_visits.pizzeria_id = 2)
order by 1 desc