-- Пожалуйста, напишите оператор SQL,
-- который возвращает
-- дату заказа из person_order таблицы и
-- соответствующее имя человека
-- (имя и возраст имеют формат, как в примере данных ниже),
-- который сделал заказ из person таблицы.
-- Добавьте сортировку по обоим столбцам в возрастающем режиме.

-- order_date     person_information
-- 2022-01-01     Andrey (age:21)


SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM person_order
         JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information
