with kate_visit as (
    select pv.pizzeria_id, pv.visit_date
    from (select name, id
        from person
        where name = 'Kate') as kate
    join person_visits as pv on kate.id = pv.person_id
)

select m.pizza_name, m.price, p.name as pizzeria_name, kate_visit.visit_date
    from menu m
join kate_visit on kate_visit.pizzeria_id = m.pizzeria_id
join pizzeria p on p.id = m.pizzeria_id
where m.price between 800 and 1000

order by 1 , 2 , 3 ,4;
