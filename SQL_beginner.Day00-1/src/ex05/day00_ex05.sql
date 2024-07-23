SELECT
    (SELECT name
     from person
     where id = person_order.person_id),
    (SELECT
    CASE
        WHEN name = 'Denis' THEN true
        ELSE false
    END
    from person
    where id = person_order.person_id) as check_name

FROM person_order
where ((menu_id = 14 or menu_id = 13 or menu_id = 18) and (order_date = '2022-01-07'))
