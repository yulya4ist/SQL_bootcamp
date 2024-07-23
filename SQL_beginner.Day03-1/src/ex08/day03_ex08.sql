INSERT INTO menu VALUES ((select max(id)+1 from menu),
                         (select id from pizzeria where name = 'Dominos'),
                         'sicilian pizza',
                         900);

--delete from menu where id in (24,23,22,21)

-- select *
-- from menu;