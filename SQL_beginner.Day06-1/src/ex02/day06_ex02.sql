select p.name,
       m.pizza_name, m.price,
       (m.price * (1 - pd.discount / 100)) as discount_price,
       piz.name as pizzeria_name

from person p
join person_order po on p.id = po.person_id
join menu m on po.menu_id = m.id
join pizzeria piz on m.pizzeria_id = piz.id
join person_discounts pd on p.id = pd.person_id and piz.id = pd.pizzeria_id

order by p.name, m.pizza_name