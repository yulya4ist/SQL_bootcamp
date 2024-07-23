select m.pizza_name, m.price, p.name as pizzeria_name
    from menu m

join pizzeria p on p.id = m.pizzeria_id

where (m.id not in (select person_order.menu_id
                        from person_order) )

order by 1,2;