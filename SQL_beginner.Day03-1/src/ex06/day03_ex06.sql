select
  a.pizza_name,
  p.name as pizzeria_name_1,
  p1.name as pizzeria_name_2,
  a.price
from
  menu as a
join menu b on a.price = b.price and a.pizza_name = b.pizza_name

join pizzeria p on p.id = a.pizzeria_id
join pizzeria p1 on p1.id = b.pizzeria_id and p.id > p1.id
where p.id != p1.id

order by 1;

