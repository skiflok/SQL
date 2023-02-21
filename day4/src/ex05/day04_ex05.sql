-- Пожалуйста, создайте представление базы данных v_price_with_discount,
-- которое возвращает заказы человека с именами людей,
-- названиями пиццы, реальной ценой и расчетным столбцом
-- discount_price(с примененной скидкой 10% и удовлетворяет формуле price - price*0.1).
-- Результат отсортируйте по имени человека и названию пиццы и округлите столбец discount_price
-- до целочисленного типа. Пожалуйста, взгляните на пример результата ниже.

-- name        pizza_name      price       discount_price
-- Andrey      cheese pizza    800         720
-- Andrey      mushroom pizza  1100        990

-- v_price_with_discount

CREATE VIEW v_price_with_discount AS
SELECT p.name                            AS name,
       m.pizza_name                      AS pizza_name,
       m.price                           AS price,
       round(m.price - m.price * 0.1, 0) AS discount_price
FROM person_order po
         JOIN person p on p.id = po.person_id
         JOIN menu m on m.id = po.menu_id
ORDER BY 1, 2;