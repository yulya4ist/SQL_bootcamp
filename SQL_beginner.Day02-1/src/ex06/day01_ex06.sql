select m.pizza_name, pizzeria.name as pizzeria_name
    from pizzeria
join menu m on m.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = m.id
join (select name, id
      from person
      where name in ('Denis','Anna')) as p
    on person_order.person_id = p.id

order by 1,2
