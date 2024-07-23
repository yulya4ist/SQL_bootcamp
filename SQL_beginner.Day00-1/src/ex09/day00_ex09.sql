SELECT
    (select name from person where person.id = pv.person_id) as person_name,
    (select name from pizzeria where pizzeria.id = pv.pizzeria_id) as pizzeria_name
FROM
    (select person_id, pizzeria_id
     from person_visits
     WHERE visit_date >= '2022-01-07' AND visit_date <= '2022-01-09') as pv
ORDER BY person_name, pizzeria_name DESC;
