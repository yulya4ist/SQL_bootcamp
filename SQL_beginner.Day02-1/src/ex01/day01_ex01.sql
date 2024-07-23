select to_char(date, 'YYYY-MM-DD') as missing_date
from generate_series('2022-01-1'::date, '2022-01-10'::date,'1 day') as date

left join (select visit_date
           from person_visits
           where person_id =1 or person_id = 2) on visit_date = date
where visit_date is NULL
order by 1
