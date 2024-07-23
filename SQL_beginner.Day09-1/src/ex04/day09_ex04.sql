create or replace function fnc_persons_male()
    returns table(
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
                 )
as $$
    select *
    from person
    where gender = 'male'
$$ language sql;

create or replace function fnc_persons_female()
    returns table(
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
                 )
as $$
    select *
    from person
    where gender = 'female'
$$ language sql;

select *
from fnc_persons_male();

select *
from fnc_persons_female();