-- Применим интервалы данных для таблицы person.
-- Пожалуйста, сделайте оператор SQL, который возвращает идентификаторы людей,
-- имена людей и интервал возрастов людей (задайте имя нового вычисляемого столбца как «interval_info»)
-- на основе приведенного ниже псевдокода.

-- if (age >= 10 and age <= 20) then return 'interval #1'
-- else if (age > 20 and age < 24) then return 'interval #2'
-- else return 'interval #3'

-- и да... пожалуйста, отсортируйте результат по столбцу «interval_info»
-- в порядке возрастания.

SELECT id,
       name,
       CASE
           WHEN age >= 10 AND age <= 20 THEN 'interval #1'
           WHEN age > 20 AND age < 24 THEN 'interval #2'
           ELSE 'interval #3' END AS interval_info
FROM person
ORDER BY interval_info