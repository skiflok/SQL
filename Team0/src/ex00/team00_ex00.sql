CREATE TABLE IF NOT EXISTS city
(
    point1 varchar,
    point2 varchar,
    cost   smallint
);

INSERT INTO city (point1, point2, cost)
VALUES ('a', 'b', 10),
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
WHERE total_cost = (SELECT min(total_cost) FROM all_trs);

