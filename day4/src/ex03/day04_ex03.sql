-- Пожалуйста, напишите оператор SQL,
-- который возвращает пропущенные дни для посещений людей в январе 2022 года.
-- Используйте v_generated_dates представление для этой задачи
-- и отсортируйте результат по столбцу missing_date.
-- Образец данных представлен ниже.


-- missing_date
-- 2022-01-11
-- 2022-01-12
-- ...

SELECT generated_date AS missing_date FROM v_generated_dates
EXCEPT ALL
SELECT DISTINCT visit_date FROM person_visits
ORDER BY 1