-- Пожалуйста, сделайте оператор select,
-- который возвращает имена людей и названия пиццерий на основе таблицы person_visit
-- с датой посещения в период с 07 января по 09 января 2022 года (включая все дни)
-- (на основе внутреннего запроса в предложении FROM).
--
-- Пожалуйста, взгляните на шаблон окончательного запроса.

-- SELECT (...) AS person_name ,  -- this is an internal query in a main SELECT clause
--         (...) AS pizzeria_name  -- this is an internal query in a main SELECT clause
-- FROM (SELECT … FROM person_visits WHERE …) AS pv -- this is an internal query in a main FROM clause
-- ORDER BY ...

--Пожалуйста, добавьте пункт заказа по имени человека по возрастанию
-- и по названию пиццерии по убыванию

SELECT (SELECT name FROM person WHERE id = pv.person_id)     AS person_name,
       (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name,
       visit_date
FROM (SELECT person_id, pizzeria_id, visit_date
      FROM person_visits
      WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name, pizzeria_name DESC