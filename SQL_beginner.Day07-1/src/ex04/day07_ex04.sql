select person.name, count(piz.name) as count_of_visits

from person
join person_visits po on person.id = po.person_id
join pizzeria piz on po.pizzeria_id = piz.id
group by 1
having count(piz.name) > 3