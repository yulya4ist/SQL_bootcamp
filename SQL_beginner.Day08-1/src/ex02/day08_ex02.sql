-- session 1
set session characteristics as transaction isolation level repeatable read;

-- session 2
set session characteristics as transaction isolation level repeatable read;

-- session 1
begin;

-- session 2
begin;

-- session 1
select * from pizzeria where name = 'pizza hut';

-- session 2
select * from pizzeria where name = 'pizza hut';

-- session 1
update pizzeria set rating = 4 where name = 'pizza hut';

-- session 2
update pizzeria set rating = 3.6 where name = 'pizza hut';

-- session 1
commit;

-- session 2
commit;

-- session 1
select * from pizzeria where name = 'pizza hut';

-- session 2
select * from pizzeria where name = 'pizza hut';
