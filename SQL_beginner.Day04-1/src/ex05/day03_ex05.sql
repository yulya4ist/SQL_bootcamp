create view v_price_with_discount as
select name, m.pizza_name, m.price, round(m.price * 0.9)::integer as discount_price
    from person p
join person_order po on p.id = po.person_id
join menu m on m.id = po.menu_id
order by name, pizza_name;

-- select *
-- from v_price_with_discount;
