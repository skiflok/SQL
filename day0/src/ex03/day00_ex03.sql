-- Пожалуйста, сделайте оператор select, который возвращает
-- идентификаторы человека (без дублирования), который посетил
-- пиццерию в период с 6 января 2022 года по 9 января 2022 года
-- (включая все дни) или посетил пиццерию с идентификатором 2.
-- Также включите пункт заказа по идентификатору человека в нисходящий режим.

-- DISTINCT убирает повторения
-- ORDER BY person_id DESC сортировка по убыванию

SELECT DISTINCT person_id
FROM person_visits
WHERE (visit_date BETWEEN '2022-01-06' AND '2022-01-09')
   OR pizzeria_id = 2
ORDER BY person_id DESC