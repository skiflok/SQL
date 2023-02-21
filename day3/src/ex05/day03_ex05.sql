-- Пожалуйста, напишите оператор SQL,
-- который возвращает список пиццерий,
-- которые Андрей посещал, но не делал заказов.
-- Пожалуйста, ORDER BY по названию пиццерии.
-- Образец данных представлен ниже.
--
-- pizzeria_name
-- Pizza Hut


WITH pz_andery_order AS (
    SELECT pz.name AS pizzeria_name
    FROM person_order AS po
             JOIN menu AS m on m.id = po.menu_id
             JOIN pizzeria pz on pz.id = m.pizzeria_id
    WHERE po.person_id = (Select id FROM person WHERE name = 'Andrey')),
     pz_andery_visit AS (
         SELECT pz.name AS pizzeria_name
         FROM person_visits AS pv
         JOIN pizzeria pz on pz.id = pv.pizzeria_id
         WHERE pv.person_id = (Select id FROM person WHERE name = 'Andrey')
     )
SELECT pizzeria_name
FROM pz_andery_visit
EXCEPT ALL
SELECT pizzeria_name
FROM pz_andery_order
ORDER BY pizzeria_name