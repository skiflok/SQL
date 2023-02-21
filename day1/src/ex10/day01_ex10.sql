-- Пожалуйста, напишите оператор SQL,
-- который возвращает список имен людей,
-- сделавших заказ на пиццу в соответствующей пиццерии.
-- Пример результата (с именованными столбцами) представлен ниже,
-- и да... пожалуйста, упорядочьте по 3 столбцам в возрастающем режиме.

-- person_name     pizza_name      pizzeria_name
-- Andrey          cheese pizza    Dominos

SELECT p.name AS person_name, m.pizza_name, pz.name AS pizzeria_name
FROM person AS p
         JOIN person_order po on p.id = po.person_id
         JOIN menu     m on m.id = po.menu_id
         JOIN pizzeria pz on pz.id = m.pizzeria_id
ORDER BY p.name, m.pizza_name, pz.name