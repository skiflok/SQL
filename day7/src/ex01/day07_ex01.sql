-- Измените оператор SQL из упражнения 00 и
-- верните имя человека (не идентификатор).
-- Дополнительным пунктом является то,
-- что нам нужно видеть только топ-4 людей
-- с максимальным количеством посещений в любых пиццериях
-- и отсортированных по имени человека.
-- Пожалуйста, взгляните на пример выходных данных ниже.

SELECT p.name, COUNT(p.name) AS count_of_visits
FROM person_visits
         JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDER BY 2 DESC, 1
LIMIT 4