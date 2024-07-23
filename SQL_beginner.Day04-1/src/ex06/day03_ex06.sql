create materialized view mv_dmitriy_visits_and_eats as
select p.name as pizzeria_name
    from pizzeria p
join person_visits pv on p.id = pv.pizzeria_id and pv.visit_date = '2022-01-08'
join person per on pv.person_id = per.id and per.name = 'Dmitriy'
join public.menu m on p.id = m.pizzeria_id and m.price < 800;

-- select *
-- from mv_dmitriy_visits_and_eats;
