select visit_date as action_date,
       (select name from person where person.id = person_visits.person_id) as person_name
        from person_visits
intersect
select order_date, (select name from person where person.id = person_order.person_id) as person_name
        from person_order

order by  action_date, person_name desc