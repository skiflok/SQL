-- Напишите оператор SQL,
-- удовлетворяющий формуле (R - S)∪(S - R).
-- Где R — person_visits таблица с фильтром на 2 января 2022 г.,
-- S — также person_visits таблица, но с другим фильтром на 6 января 2022 г.
-- Пожалуйста, сделайте расчеты с наборами под столбцом,
-- person_id и этот столбец будет единственным в результате.
-- Отсортируйте результат по person_id столбцу и окончательный SQL-код,
-- пожалуйста, представьте в v_symmetric_union виде (*) базы данных.
-- (*) честно говоря, в теории множеств не существует определения
-- «симметричное объединение».
-- Это авторская интерпретация,
-- основная идея основана на существующем правиле симметричного различия.

CREATE VIEW v_symmetric_union AS
WITH r AS (
SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-02'),
s AS (SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-06')
(SELECT person_id FROM r
EXCEPT ALL
SELECT person_id FROM s)
UNION ALL
(SELECT person_id FROM s
EXCEPT ALL
SELECT person_id FROM r)
ORDER BY 1