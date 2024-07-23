select piz.name,
       count(po.id) as count_of_orders,
       round(avg(price),2) as average_price,
       max(price) as max_price,
       min(price) as min_price

from pizzeria piz
join menu m on piz.id = m.pizzeria_id
join person_order po on m.id = po.menu_id
group by 1
order by name;