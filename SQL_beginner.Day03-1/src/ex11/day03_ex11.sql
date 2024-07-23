update menu
set price = (select price from menu where pizza_name = 'greek pizza') * 0.9
where menu.pizza_name = 'greek pizza';

-- select *
-- from menu;