-- Пожалуйста, напишите оператор SQL,
-- который возвращает агрегированную информацию
-- по адресу человека,
-- результат «Максимальный возраст - (минимальный возраст / максимальный возраст)»,
-- который представлен в виде столбца формулы,

-- следующий - средний возраст по адресу и

-- результат сравнения между формулой и средние столбцы
-- (другими словами, если формула больше среднего,
-- то значение True, в противном случае значение False).
-- Результат должен быть отсортирован по столбцу адреса.
-- Пожалуйста, взгляните на образец выходных данных ниже.

-- address         formula         average         comparison
-- Kazan           44.71           30.33           true

WITH t AS (
SELECT address,
       round(max(CAST(age AS numeric)) - (min(CAST(age AS numeric)) / max(age)), 2) AS formula,
       round(avg(age), 2) AS average
FROM person
GROUP BY address
ORDER BY address)
SELECT *,
       CASE WHEN formula > average THEN true ELSE false END
       FROM t
