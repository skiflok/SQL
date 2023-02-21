-- Пожалуйста, используйте оператор SQL из упражнения № 01 и
-- покажите названия пицц из пиццерии,
-- которые никто не заказывал, включая соответствующие цены.
-- Результат должен быть отсортирован по названию пиццы и цене.
-- Пример выходных данных представлен ниже.
--
-- pizza_name      price       pizzeria_name
-- cheese pizza    700         Papa Johns
-- cheese pizza    780         DoDo Pizza


WITH not_order_menu_id AS (
    SELECT id AS menu_id
    FROM menu
    WHERE id NOT IN (SELECT menu_id FROM person_order)
    ORDER BY menu_id)
SELECT pizza_name, price, name AS pizzeria_name
FROM not_order_menu_id
         JOIN menu ON id = not_order_menu_id.menu_id
         JOIN pizzeria p on p.id = menu.pizzeria_id
ORDER BY pizza_name, price