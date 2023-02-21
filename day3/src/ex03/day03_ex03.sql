-- Пожалуйста,
-- найдите объединение пиццерий,
-- которые посещали женщины или мужчины.
-- Другими словами, вы должны найти набор названий пиццерий,
-- которые посещали только женщины,
-- и выполнить операцию "UNION" с набором названий пиццерий,
-- которые посещали только мужчины.
-- Обратите внимание на слово «only» для обоих полов.
-- Для любых операторов SQL с множествами сохраняйте дубликаты
-- ( UNION ALL, EXCEPT ALL, INTERSECT ALL конструкции).
-- Пожалуйста, отсортируйте результат по названию пиццерии.
-- Образец данных представлен ниже.
--
-- pizzeria_name
-- Best Pizza
-- Dominos

WITH male AS (
    SELECT p2.name
    FROM person_visits
             JOIN person p on p.id = person_visits.person_id
             JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
    WHERE gender = 'male'),
     female AS (
         SELECT p2.name
         FROM person_visits
                  JOIN person p on p.id = person_visits.person_id
                  JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
         WHERE gender = 'female'),
     only_male AS (SELECT name FROM male EXCEPT ALL SELECT name FROM female),
     only_female AS (SELECT name FROM female EXCEPT ALL SELECT name FROM male)

SELECT name AS pizzeria_name
FROM only_male
UNION ALL
SELECT name AS pizzeria_name
FROM only_female
ORDER BY pizzeria_name