select m.pizza_name, p.name as pizzeria_name,m.price
    from menu m
right join pizzeria p
        on p.id = m.pizzeria_id
    where (m.pizza_name in ('mushroom pizza', 'pepperoni pizza'))

order by m.pizza_name, pizzeria_name