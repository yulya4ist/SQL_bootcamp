with male as (
        select  piz.name as pizzeria_name
    from person per
    join person_visits pv on per.id = pv.person_id
    join pizzeria piz on pv.pizzeria_id = piz.id
    where per.gender = 'male'
    ),
    female as (
        select  piz.name as pizzeria_name
    from person per
    join person_visits pv on per.id = pv.person_id
    join pizzeria piz on pv.pizzeria_id = piz.id
    where per.gender = 'female'
    )

select * from female
    except all
    select * from male

union all

select * from male
    except all
    select * from female

order by 1

