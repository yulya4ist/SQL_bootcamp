select id as munu_id
    from menu m
where m.id not in (select person_order.menu_id
                        from person_order)
order by 1
