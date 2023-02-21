-- Пожалуйста,
-- найдите имена всех мужчин из Москвы или Самары,
-- которые заказывают либо пепперони, либо грибную пиццу (или и то, и другое).
-- Упорядочить результат по имени человека в порядке убывания.
-- Образец вывода представлен ниже.
--
-- name
-- Dmitriy
-- ...


WITH name_male_adreess AS (
    SELECT id, name
    FROM person
    WHERE gender = 'male'
      AND (address IN ('Moscow', 'Samara'))),
     pizza AS
         (SELECT person_id AS id
          FROM person_order
                   JOIN menu m on m.id = person_order.menu_id
          WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza'))
SELECT name
FROM name_male_adreess
         NATURAL JOIN pizza
ORDER BY name DESC