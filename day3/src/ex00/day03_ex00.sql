-- Пожалуйста, напишите оператор SQL,
-- который возвращает список
-- названий пицц, цен на пиццы, названий пиццерий и дат посещения
-- для Кати и цен в диапазоне от 800 до 1000 рублей.
-- Сортируйте по пицце, цене и названию пиццерии.
-- Взгляните на образец данных ниже.
--
-- pizza_name      price       pizzeria_name       visit_date
-- cheese pizza    950         DinoPizza           2022-01-04
-- pepperoni pizza 800         Best Pizza          2022-01-03

SELECT pizza_name, price, p2.name AS pizzeria_name, visit_date
FROM person_visits
         JOIN person p on p.id = person_visits.person_id
         JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
         JOIN menu m on p2.id = m.pizzeria_id
WHERE p.name IN ('Kate')
  AND price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name
