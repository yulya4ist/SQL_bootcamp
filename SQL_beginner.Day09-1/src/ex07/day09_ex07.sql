CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS char
AS $$
    SELECT MIN(array_table) FROM unnest(arr) AS array_table
$$LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

-- DROP FUNCTION IF EXISTS func_minimum(arr numeric[]);
