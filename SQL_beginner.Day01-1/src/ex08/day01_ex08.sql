SELECT order_date,
       CONCAT(name,' (age:',age,')') as person_information
FROM person_order AS po(person_id,id,menu_id,order_date)
NATURAL JOIN person

ORDER BY order_date, person_information;