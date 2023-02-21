-- Найдите, пожалуйста,
-- название пиццерии, которую
-- Дмитрий посетил 8 января 2022 года
-- и смог съесть пиццу менее чем за 800 рублей.


WITH pz_cost AS (
    -- находим пицерии с пицами мешьше 800
    SELECT pizzeria_id, name AS pizzeria_name
    FROM pizzeria
             JOIN menu m ON pizzeria.id = m.pizzeria_id
    WHERE price < 800),
    --находим где был Дмитрий 8 числа
     den_date AS (
         SELECT pizzeria_id
         FROM person
                  JOIN person_visits pv ON person.id = pv.person_id
         WHERE name = 'Dmitriy'
           AND visit_date = '2022-01-08')
-- находим название пицерии по id
SELECT pizzeria_name
FROM pz_cost
         NATURAL JOIN den_date