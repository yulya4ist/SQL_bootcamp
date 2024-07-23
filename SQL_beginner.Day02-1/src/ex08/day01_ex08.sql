select person.name
    from person
join (select person_order.person_id, person_order.menu_id
          from person_order) po on po.person_id = person.id
join menu m on m.id = po.menu_id and (m.pizza_name = 'mushroom pizza' or m.pizza_name = 'pepperoni pizza')
where person.gender = 'male' and (person.address in ('Moscow', 'Samara'))
order by person.name desc

