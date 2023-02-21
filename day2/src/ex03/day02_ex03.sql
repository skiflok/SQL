-- Вернемся к упражнению № 01.
-- Пожалуйста, перепишите свой SQL,
-- используя шаблон CTE (Common Table Expression).
-- Пожалуйста, перейдите в часть CTE вашего "дневного генератора".
-- Результат должен быть таким же, как в упражнении № 01.

-- Пожалуйста, напишите оператор SQL,
-- который возвращает пропущенные дни с 1 по 10 января 2022 года
-- (включая все дни) для посещений лиц с идентификаторами 1 или 2.
-- Упорядочьте по дням посещения по возрастанию.
-- Образец данных с именем столбца представлен ниже.


WITH gs_person_id AS (SELECT generate_series(1, 2) AS gs_id),
     gs_date_t AS (SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs_date)
SELECT gs_date::date AS missing_date
FROM person_visits AS pv
         JOIN gs_person_id ON person_id = gs_person_id.gs_id
         RIGHT JOIN gs_date_t ON visit_date = gs_date_t.gs_date
WHERE gs_id IS NULL
ORDER BY visit_date