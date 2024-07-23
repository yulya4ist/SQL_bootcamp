select name, rating
from pizzeria
left join person_visits on person_visits.pizzeria_id = pizzeria.id
where person_visits.pizzeria_id is NULL

--находим все пиццерии и если в обьединении нет таких, то возвращаем ноль, который ловим в следующнй строке