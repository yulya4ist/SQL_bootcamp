create view v_generated_dates as
    select date_table::date as generated_date
FROM generate_series('2022-01-01'::date,'2022-01-31'::date,'1 day') AS date_table;

-- select *
-- from v_generated_dates;