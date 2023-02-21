-- Давайте вернемся к упражнению № 03 и изменим нашу инструкцию SQL,
-- чтобы она возвращала имена людей вместо идентификаторов людей,
-- и изменим порядок на action_date в возрастающем режиме,
-- а затем на person_name в нисходящем режиме.
-- Пожалуйста, взгляните на образец данных ниже.

-- 06
-- SELECT order_date                                                  AS action_date,
--        (SELECT name FROM person WHERE id = person_order.person_id) AS person_name
-- FROM person_order
-- INTERSECT
-- SELECT visit_date                                                   AS action_date,
--        (SELECT name FROM person WHERE id = person_visits.person_id) AS person_name
-- FROM person_visits
-- ORDER BY action_date, person_name DESC

SELECT order_date AS action_date,
       name       AS person_name
FROM person_order,
     person
WHERE person_order.person_id = person.id
INTERSECT
SELECT visit_date AS action_date,
       name       AS person_name
FROM person_visits,
     person
WHERE person_visits.person_id = person.id
ORDER BY action_date, person_name DESC