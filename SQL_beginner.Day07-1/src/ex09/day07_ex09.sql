with form as (
    select  address,
       round(max(age::numeric) - (min(age::numeric) / max(age::numeric)),2) as formula,
       round(avg(age),2) as average
    from person p
    group by 1
)

select address, formula, average, formula > average as comparison
from form
order by 1