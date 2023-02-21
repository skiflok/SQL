-- Пожалуйста, напишите оператор SQL,
-- который возвращает количество заказов,
-- среднюю цену,
-- максимальную и минимальную цены на пиццу,
-- проданную соответствующим рестораном-пиццерией.
-- Результат должен быть отсортирован по названию пиццерии.
-- Пожалуйста, взгляните на образец данных ниже.
-- Округлите среднюю цену до 2 плавающих чисел.

-- name        count_of_orders         average_price       max_price       min_price
-- Best Pizza  5                       780                 850             700

SELECT p.name AS name,
       count(p.name)          AS count_of_orders,
       round(avg(m.price), 2) AS average_price,
       max(m.price)           AS max_price,
       min(m.price)           AS min_price
FROM person_order
         JOIN menu m on m.id = person_order.menu_id
         JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY 1
