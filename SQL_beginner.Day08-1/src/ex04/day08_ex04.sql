-- console 1
SET SESSION CHARACTERISTICS AS TRANSACTION isolation level SERIALIZABLE;

-- console 2
SET SESSION CHARACTERISTICS AS TRANSACTION isolation level SERIALIZABLE;

--console 1
begin;
-- console 2
begin;
-- console 1
select * from pizzeria where name = 'Pizza Hut';
-- console 2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
-- console 2
commit;
-- console 1
select * from pizzeria where name = 'Pizza Hut';
-- console 1
commit;
-- console 1
select * from pizzeria where name = 'Pizza Hut';
-- console 2
select * from pizzeria where name = 'Pizza Hut';