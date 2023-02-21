WITH RECURSIVE
    trace(tour, point1, point2, cost, sum) AS (
        SELECT point1, *, cost
        FROM city
        WHERE city.point1 = 'a'
        UNION
        SELECT concat_ws(',', tour, c.point1), c.point1, c.point2, c.cost, sum + c.cost
        FROM city c
                 INNER JOIN trace ON c.point1 = trace.point2 AND tour NOT LIKE '%' || c.point1 || '%'
    ),
    all_trs AS (
        SELECT sum AS total_cost, '{' || tour || ',' || point2 || '}' AS tour
        FROM trace
        WHERE point2 = 'a'
          AND length(tour) = (SELECT max(length(tour)) FROM trace)
        ORDER BY 1, 2
    )

SELECT *
FROM all_trs