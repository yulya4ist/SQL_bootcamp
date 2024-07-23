with Dron_visit as (
        select pv.visit_date, pv.pizzeria_id, po.order_date, p.name as pizzeria_name
        from (
            select id
                from person
                where name = 'Andrey'
             ) as Dron

        join person_visits pv on Dron.id = pv.person_id
        join person_order po on po.person_id = Dron.id
        join pizzeria p on p.id = pv.pizzeria_id
        where po.order_date != pv.visit_date
    )

select distinct pizzeria_name
from Dron_visit
