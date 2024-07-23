comment on table person_discounts is 'Таблица с персональными скидками для человека в конкретной пиццерии';

comment on column person_discounts.id is 'первичный ключ -- кол-во персональных скидок';
comment on column person_discounts.person_id is 'Внешний ключ id человека';
comment on column person_discounts.pizzeria_id is 'Внешний ключ id пиццерии';
comment on column person_discounts.discount is 'Персональная скадка в процентах';
