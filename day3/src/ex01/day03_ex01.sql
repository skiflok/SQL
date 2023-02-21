-- Пожалуйста,
-- найдите все идентификаторы меню,
-- которые никем не заказаны.
-- Результат должен быть отсортирован по идентификаторам.
-- Пример выходных данных представлен ниже.
--
-- menu_id
-- 5
-- 10
-- ...

SELECT id AS menu_id
FROM menu
WHERE id NOT IN (SELECT menu_id FROM person_order)
ORDER BY menu_id