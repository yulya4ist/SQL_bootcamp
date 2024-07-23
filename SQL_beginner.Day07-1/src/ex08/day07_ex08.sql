select p.address, piz.name, count(piz.name) as count_of_orders

from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
join pizzeria piz on m.pizzeria_id = piz.id
group by 1, 2
order by 1, 2;