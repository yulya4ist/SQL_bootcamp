select coalesce(person.name, '-') as persons_name, pv.visit_date, coalesce(pizzeria.name,'-') as pizzeria_name
from person
left join (
    select *
    from person_visits
    where visit_date between '2022-01-01' and '2022-01-03') as pv
    on person.id = pv.person_id
full join pizzeria on pizzeria.id = pv.pizzeria_id
order by persons_name, visit_date, pizzeria_name
