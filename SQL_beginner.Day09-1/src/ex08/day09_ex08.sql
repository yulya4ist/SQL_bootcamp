create or replace function fnc_fibonacci(in pstop integer = 10)
    returns table(
            fib bigint
                 )
as $$
    with recursive fib(n1,n2) as(
    select 0,1
    union all
    select f.n2 as n1,f.n1+f.n2 as n2
    from fib f
    -- LIMIT 11
    where f.n2 < pstop
    )
    select f.n1
    from fib f

$$ language sql;



select * from fnc_fibonacci(100);
select * from fnc_fibonacci();