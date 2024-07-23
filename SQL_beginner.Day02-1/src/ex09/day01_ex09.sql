with peperoni as (
    select pizza_name, person_id
        from menu
        join person_order po on po.menu_id = menu.id
        where pizza_name = 'pepperoni pizza'
), cheese as (
    select pizza_name, person_id
        from menu
        join person_order po on po.menu_id = menu.id
        where pizza_name = 'cheese pizza'
)

select name
from(select id, name
     from person
     where gender = 'female') as p
join peperoni on peperoni.person_id = p.id
join cheese on cheese.person_id = p.id
order by name

