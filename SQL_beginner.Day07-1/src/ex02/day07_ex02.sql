with most_order as (
    select piz.name, count(piz.name) as count, 'order' as action_type
    from person_order po
    join menu m on po.menu_id = m.id
    join pizzeria piz on piz.id = m.pizzeria_id
    group by 1
    order by count desc
    limit 3
    ),
    most_visit as (
    select piz.name, count(piz.name) as count, 'visit' as action_type
    from person_visits pv
    join pizzeria piz on pv.pizzeria_id = piz.id
    group by 1
    order by count desc
    limit 3
    )

select *
from most_order
union all
select *
from most_visit;