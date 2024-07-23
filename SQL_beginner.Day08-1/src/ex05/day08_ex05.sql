-- console 1
SET SESSION CHARACTERISTICS AS TRANSACTION isolation level READ COMMITTED;
-- console 2
SET SESSION CHARACTERISTICS AS TRANSACTION isolation level READ COMMITTED;

--console 1
begin;
-- console 2
begin;
-- console 1
select sum(rating) from pizzeria;
-- console 2
update pizzeria set rating = 1 where name = 'Pizza Hut';
-- console 2
commit;
-- console 1
select sum(rating) from pizzeria;
-- console 1
commit;
-- console 1
select sum(rating) from pizzeria;
-- console 2
select sum(rating) from pizzeria;