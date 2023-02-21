-- Пожалуйста, напишите оператор SQL,
-- который возвращает пропущенные дни с 1 по 10 января 2022 года
-- (включая все дни) для посещений лиц с идентификаторами 1 или 2.
-- Упорядочьте по дням посещения по возрастанию.
-- Образец данных с именем столбца представлен ниже.

SELECT gs_date::date AS missing_date
FROM person_visits AS pv
         JOIN generate_series(1, 2) AS gs_id
              ON person_id = gs_id
         RIGHT JOIN generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs_date
                    ON visit_date = gs_date
WHERE gs_id IS NULL
ORDER BY visit_date