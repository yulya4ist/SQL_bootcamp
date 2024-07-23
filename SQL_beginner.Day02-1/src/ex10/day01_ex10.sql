with person_two as(
    select *
    from person
)

select person_one.name as person_name1,
       person_two.name as person_name2,
       person_one.address as common_address
from person as person_one
join person_two on person_one.address = person_two.address
where person_one.id > person_two.id