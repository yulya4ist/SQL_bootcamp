-- drop table if exists currency cascade;
--
-- drop table if exists balance cascade;
--
-- drop table if exists "user" cascade;

create table "user"
(id bigint primary key not null ,
 name varchar(20),
 lastname varchar(20));

insert into "user" values (1,'Иван', 'Иванов');
insert into "user" values (2,'Петр', null);
insert into "user" values (3, null, 'Сидоров');
insert into "user" values (4, 'Артём', null);

create table currency(
    id bigint not null ,
    name varchar(4) not null ,
    rate_to_usd numeric not null default 1,
    updated timestamp default current_date
);

insert into currency values (100, 'EUR', 0.9, '2022-03-03 13:31');
insert into currency values (100, 'EUR', 0.89, '2022-03-02 12:31');
insert into currency values (100, 'EUR', 0.87, '2022-03-02 08:00');
insert into currency values (100, 'EUR', 0.9, '2022-03-01 15:36');
insert into currency values (200, 'USD', 1, '2022-03-03 13:31');
insert into currency values (200, 'USD', 1, '2022-03-02 12:31');
insert into currency values (300, 'JPY', 0.0087, '2022-03-03 13:31');
insert into currency values (300, 'JPY', 0.0079, '2022-03-01 13:31');


create table balance
(user_id bigint not null,
 money numeric not null,
 type integer not null default 0,
 currency_id integer not null,
 updated timestamp default current_date,
 constraint fk_balance_user_id foreign key (user_id) references "user"(id)
--  К сожалению в постгрессе нет подобной команды MAX_ROWS
);
insert into balance values (4, 120,1, 200, '2022-01-01 01:31');
insert into balance values (4, 120,0, 300, '2022-01-01 01:31');
insert into balance values (1, 20,1, 100, '2022-01-01 13:31');
insert into balance values (1, 200,1, 100, '2022-01-09 13:31');
insert into balance values (1, 190,1, 100, '2022-01-10 13:31');
insert into balance values (2, 100,2, 210, '2022-01-09 13:31');
insert into balance values (2, 103,2, 210, '2022-01-10 13:31');
insert into balance values (3, 50,0, 100, '2022-01-09 13:31');
insert into balance values (3, 500,1, 200, '2022-01-09 13:31');
insert into balance values (3, 500,2, 300, '2022-01-09 13:31');

create unique index idx_user_id ON "user"(id);
create index idx_user ON "user"(name,lastname);
create index idx_balance ON balance(money, type, currency_id, updated);
create index idx_currency ON currency(id, name, rate_to_usd, updated);