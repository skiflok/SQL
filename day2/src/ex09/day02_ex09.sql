-- Пожалуйста,
-- найдите имена всех женщин,
-- которые заказывали и пепперони, и сырную пиццу (в любое время и в любых пиццериях).
-- Убедитесь, что результат упорядочен по имени человека.
-- Образец данных представлен ниже.
--
-- name
-- Anna
-- ...

WITH name_female AS (
    SELECT id, name
    FROM person
    WHERE gender = 'female'),
     pepperoni_pizza AS
         (SELECT person_id AS id
          FROM person_order
                   JOIN menu m on m.id = person_order.menu_id
          WHERE pizza_name IN ('pepperoni pizza')),
     cheese_pizza AS
         (SELECT person_id AS id
          FROM person_order
                   JOIN menu m on m.id = person_order.menu_id
          WHERE pizza_name IN ('cheese pizza'))
SELECT name
FROM name_female
         NATURAL JOIN pepperoni_pizza
         NATURAL JOIN cheese_pizza
ORDER BY name

