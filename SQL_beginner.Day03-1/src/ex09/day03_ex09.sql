insert into person_visits
values ((select max(id) + 1 from person_visits),
        (select person.id from person where name = 'Denis'),
        (select pizzeria.id from pizzeria where pizzeria.name = 'Dominos'),
        ('2022-02-24')),
        ((select max(id) + 2 from person_visits),
        (select person.id from person where name = 'Irina'),
        (select pizzeria.id from pizzeria where pizzeria.name = 'Dominos'),
        ('2022-02-24'));

-- select *
-- from person_visits;