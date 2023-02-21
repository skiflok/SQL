-- Пожалуйста, напишите оператор SQL,
-- который возвращает список названий пиццерий
-- с соответствующим значением рейтинга,
-- которые не посещались людьми.

SELECT name, rating
FROM pizzeria AS pz
         LEFT JOIN person_visits AS pv on pz.id = pv.pizzeria_id
WHERE visit_date ISNULL