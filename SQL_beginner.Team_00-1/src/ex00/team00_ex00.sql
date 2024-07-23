CREATE TABLE paths
(
    p1 char,
    p2 char,
    cost integer
);

INSERT INTO paths(p1, p2, cost)
VALUES
        ('a', 'b', 10),
        ('a', 'c', 15),
        ('a', 'd', 20),
        ('b', 'a', 10),
        ('b', 'c', 35),
        ('b', 'd', 25),
        ('c', 'a', 15),
        ('c', 'b', 35),
        ('c', 'd', 30),
        ('d', 'a', 20),
        ('d', 'b', 25),
        ('d', 'c', 30);
		

WITH CTE_TOURS AS
	(SELECT
		pnt1.cost + pnt2.cost + pnt3.cost + pnt4.cost AS total_cost,
		'{' || pnt1.p1 || ',' || pnt1.p2 || ',' || pnt2.p2 || ',' || pnt3.p2 || ',' || pnt4.p2 || '}' AS tour
	FROM
		paths pnt1
		JOIN paths pnt2 ON pnt1.p2 = pnt2.p1
		JOIN paths pnt3 ON pnt2.p2 = pnt3.p1
		JOIN paths pnt4 ON pnt3.p2 = pnt4.p1
	WHERE
		pnt1.p1 = 'a'
		AND pnt2.p2 != pnt1.p1
		AND pnt3.p2 != pnt1.p1
		AND pnt3.p2 != pnt2.p1
		AND pnt4.p2 = pnt1.p1
	ORDER BY
		total_cost,
		tour
	)

SELECT * FROM CTE_TOURS
WHERE (select min(total_cost) FROM CTE_TOURS) = total_cost;
