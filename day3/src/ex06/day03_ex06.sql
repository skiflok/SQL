-- Пожалуйста,
-- найдите одинаковые названия пиццы,
-- которые имеют одинаковую цену,
-- но из разных пиццерий.
-- Убедитесь, что результат упорядочен по названию пиццы.
-- Образец данных представлен ниже.
-- Пожалуйста, убедитесь, что ваши имена столбцов соответствуют именам столбцов ниже.
--
-- pizza_name      pizzeria_name_1     pizzeria_name_2     price
-- cheese pizza    Best Pizza          Papa Johns          700


WITH t1 AS (
    SELECT menu.id, pizza_name, price, pz.name AS pizzeria_name_1
    FROM menu
             JOIN pizzeria pz on pz.id = menu.pizzeria_id
),
     t2 AS (
         SELECT menu.id, pizza_name, price, pz.name AS pizzeria_name_2
         FROM menu
                  JOIN pizzeria pz on pz.id = menu.pizzeria_id
     )
SELECT t1.pizza_name, t1.pizzeria_name_1, t2.pizzeria_name_2, t1.price
FROM t1
         JOIN t2 ON t1.price = t2.price AND t1.pizza_name = t2.pizza_name
    AND t1.id > t2.id
