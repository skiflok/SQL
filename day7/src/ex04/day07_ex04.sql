-- Пожалуйста, напишите оператор SQL,
-- который возвращает имя человека и
-- соответствующее количество посещений в любой пиццерии,
-- если человек посетил более 3 раз (> 3).
-- Пожалуйста, взгляните на образец данных ниже.

SELECT p.name, count(p.name) AS count_of_visits
FROM person_visits
JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
HAVING count(p.name) > 3