-- Пожалуйста, напишите оператор SQL,
-- чтобы увидеть 3 любимых ресторана по посещениям и
-- по заказам в одном списке (пожалуйста, добавьте столбец action_type
-- со значениями «order» или «visit», это зависит от данных из соответствующей таблицы).
-- Пожалуйста, взгляните на образец данных ниже.
-- Результат должен быть отсортирован по столбцу action_type
-- в возрастающем режиме и по столбцу count в нисходящем режиме.

-- name        count       action_type
-- Dominos     6           order
-- ...         ...         ...
-- Dominos     7           visit

(SELECT name, COUNT(name) as count, 'visit' AS action_type
 FROM person_visits
          JOIN pizzeria p on p.id = person_visits.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
UNION
(SELECT p.name, COUNT(name) as count, 'order' AS action_type
 FROM person_order
          JOIN menu m on m.id = person_order.menu_id
          JOIN pizzeria p on p.id = m.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
ORDER BY action_type, count DESC