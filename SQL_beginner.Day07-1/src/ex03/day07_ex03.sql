with most_order as (
    select piz.name, count(piz.name) as count, 'order' as action_type
    from person_order po
    join menu m on po.menu_id = m.id
    join pizzeria piz on piz.id = m.pizzeria_id
    group by 1
    order by count desc
    ),
    most_visit as (
    select piz.name, count(piz.name) as count, 'visit' as action_type
    from person_visits pv
    join pizzeria piz on pv.pizzeria_id = piz.id
    group by 1
    order by count desc
    ),
    sum_vis_and_ord as (
    select *
    from most_order
    union all
    select *
    from most_visit)

select sum_vis_and_ord.name as name, sum( sum_vis_and_ord.count ) as total_count
from sum_vis_and_ord
group by 1
order by total_count desc, name asc
