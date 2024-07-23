-- console 1
set SESSION CHARACTERISTICS AS TRANSACTION isolation level REPEATABLE READ;
-- console 2
set SESSION CHARACTERISTICS AS TRANSACTION isolation level REPEATABLE READ;

--console 1
begin;
-- console 2
begin;
-- console 1
update pizzeria set rating = 4 where id = 1;
-- console 2
update pizzeria set rating = 4.5 where id = 2;
-- console 1
update pizzeria set rating = 1 where id = 2;
-- console 2
update pizzeria set rating = 2 where id = 1;
-- console 1
commit;
-- console 2
commit;
