-- Мы знаем о личных адресах из наших данных.
-- Представим, что этот конкретный человек
-- посещает пиццерии только в своем городе.
-- Пожалуйста, напишите оператор SQL, который возвращает
-- адрес,
-- название пиццерии и
-- количество заказов.
-- Результат должен быть отсортирован
-- по адресу, а затем
-- по названию ресторана.
-- Пожалуйста, взгляните на образец выходных данных ниже.

-- address         name            count_of_orders
-- Kazan           Best Pizza      4

SELECT p.address,
       p2.name,
       count(po.person_id) AS count_of_orders
FROM person_order po
         JOIN person p on p.id = po.person_id
         JOIN menu m on m.id = po.menu_id
         JOIN pizzeria p2 on p2.id = m.pizzeria_id
GROUP BY p.address, p2.name
ORDER BY 1, 2
