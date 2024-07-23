with vis_per as (
    select per.gender, piz.name
    from person per
        join person_order po on per.id = po.person_id
        join menu m on po.menu_id = m.id
        join pizzeria piz on m.pizzeria_id = piz.id
) , only_man as (
    select name
        from vis_per
        where gender = 'male'
), only_weman as (
    select name
        from vis_per
        where gender = 'female')

select name as pizzeria_name
    from only_weman
except
select name as pizzeria_name
    from only_man

