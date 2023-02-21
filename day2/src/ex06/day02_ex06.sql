-- Пожалуйста, найдите все названия пицц (и соответствующие названия пиццерий с помощью menu таблицы),
-- которые заказывали Денис или Анна.
-- Отсортируйте результат по обоим столбцам.
-- Образец вывода представлен ниже.

-- pizza_name      pizzeria_name
-- cheese pizza    Best Pizza

WITH orders AS (SELECT person_id, menu_id
                FROM person_order
                         JOIN person p on p.id = person_order.person_id
                WHERE name = 'Anna'
                   OR name = 'Denis')
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM orders
         JOIN menu AS m ON orders.menu_id = m.id
         JOIN pizzeria AS pz on pz.id = m.pizzeria_id

ORDER BY m.pizza_name, pizzeria_name
