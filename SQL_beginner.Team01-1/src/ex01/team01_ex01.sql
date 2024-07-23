WITH common_balance AS (
    SELECT
        balance.user_id,
        currency.id,
        currency.name,
        balance.money,
        (SELECT currency.rate_to_usd FROM currency
            WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
            ORDER BY rate_to_usd LIMIT 1
            ) AS min_rate,
        (SELECT currency.rate_to_usd FROM currency
            WHERE currency.id = balance.currency_id  AND currency.updated > balance.updated
            ORDER BY rate_to_usd LIMIT 1
            ) AS max_rate
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
    GROUP BY
        balance.money,
        currency.name,
        currency.id,
        balance.updated,
        balance.currency_id,
        balance.user_id
    ORDER BY min_rate DESC, max_rate
)

SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    common_balance.name AS currency_name,
    common_balance.money * COALESCE(common_balance.min_rate, common_balance.max_rate) AS currency_in_usd
FROM common_balance
LEFT JOIN "user" ON common_balance.user_id = "user".id
ORDER BY name DESC, lastname, currency_name;