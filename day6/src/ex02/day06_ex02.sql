-- Пожалуйста, напишите оператор SQL,
-- который возвращает заказы с фактической ценой
-- и ценой с примененной скидкой для каждого человека
-- в соответствующем ресторане-пиццерии и
-- сортирует по имени человека и названию пиццы.
-- Пожалуйста, взгляните на образец данных ниже.

-- name        pizza_name      price       discount_price      pizzeria_name
-- Andrey      cheese pizza    800         624                 Dominos


SELECT p.name                                       AS nane,
       m.pizza_name,
       m.price,
       m.price - m.price * pd.discount / 100 AS discount_price,
       pz.name                                      AS pizzeria_name
FROM person_order
         JOIN person p on p.id = person_order.person_id
         JOIN menu m on m.id = person_order.menu_id
         JOIN pizzeria pz on pz.id = m.pizzeria_id
         JOIN person_discounts pd on p.id = pd.person_id and pz.id = pd.pizzeria_id
ORDER BY 1, 2

