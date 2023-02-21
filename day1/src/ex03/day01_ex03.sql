-- Пожалуйста, напишите оператор SQL,
-- который возвращает общие строки для атрибутов
-- order_date, person_id из таблицы person_order с одной стороны и
-- visit_date, person_id из таблицы person_visits с другой стороны (см. пример ниже).
-- Другими словами, найдем идентификаторы людей,
-- которые заходили и заказывали пиццу в один и тот же день.
-- На самом деле, пожалуйста, добавьте сортировку по action_date в порядке возрастания,
-- а затем по person_id в порядке убывания.

SELECT order_date AS action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date AS action_date, person_id
FROM person_visits
ORDER BY action_date, person_id DESC