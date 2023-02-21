-- Найдите полную информацию обо всех возможных названиях пиццерий и ценах,
-- чтобы получить пиццу с грибами или пепперони.
-- Затем отсортируйте результат по названию пиццы и названию пиццерии.
-- Результат выборки данных приведен ниже
-- (пожалуйста, используйте те же имена столбцов в своем операторе SQL).
--
-- pizza_name           pizzeria_name       price
-- mushroom pizza       Dominos             1100

SELECT pizza_name, name AS pizzeria_name, price
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name = 'pepperoni pizza'
   OR pizza_name = 'mushroom pizza'
ORDER BY pizza_name, pizzeria_name