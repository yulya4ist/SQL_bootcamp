
WITH balance_user AS (
    SELECT coalesce(u.name,'not defined') AS name,
           coalesce(lastname,'not defined') AS lastname,
           b.type AS type,
           b.currency_id AS c_id,
           SUM(b.money) AS volume
    FROM "user" u
    RIGHT JOIN balance b on u.id = b.user_id
    GROUP BY 1,2,3,4
    ORDER BY 1 DESC,2,3
), curr AS (
    SELECT
        bu.name AS name,
        bu.lastname AS lastname,
        bu.type AS type,
        bu.volume AS volume,
        coalesce(c.name, 'not defined') AS currency_name,
        bu.c_id
    FROM balance_user bu
    LEFT JOIN currency c ON bu.c_id = c.id
    GROUP BY 1,2,3,4,c.name, c.updated,bu.c_id
    ORDER BY 1 DESC,2,3
    )
, rtu AS (
    SELECT sq.id AS id,c.rate_to_usd,sq.last_date
    FROM(SELECT id,MAX(updated) AS last_date
    FROM currency
    GROUP BY 1) AS sq
    JOIN currency c ON sq.id = c.id AND sq.last_date = c.updated
)
SELECT name,lastname,type,volume,currency_name,
       coalesce(rtu.rate_to_usd,1) AS last_rate_to_usd,
       volume * coalesce(rtu.rate_to_usd,1) AS total_volume_in_usd
FROM curr

LEFT JOIN rtu ON curr.c_id = rtu.id
GROUP BY 1,2,3,4,5,6,7
ORDER BY 1 DESC,2,3