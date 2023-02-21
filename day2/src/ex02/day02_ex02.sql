-- Пожалуйста, напишите оператор SQL,
-- который возвращает полный список имен людей,
-- посетивших (или не посещенных) пиццерии в период с 1 по 3 января 2022 года с одной стороны,
-- и весь список имен пиццерий, которые были посещены (или не посещены) с другой стороны.
-- Обратная сторона. Образец данных с необходимыми именами столбцов представлен ниже.
-- Обратите внимание на значение замены «-» для NULL значений в столбцах person_name и .
-- pizzeria_name Пожалуйста, также добавьте порядок для всех 3 столбцов.

-- person_name     visit_date      pizzeria_name
-- -               null            DinoPizza
-- -               null            DoDo Pizza
-- Andrey          2022-01-01      Dominos


SELECT COALESCE(p.name, '-') AS person_name, visit_date, COALESCE(v.name, '-') AS pizzeria_name
FROM person AS p
FULL JOIN
	(SELECT *
	 FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS v
	 FULL JOIN pizzeria AS pz ON pz.id = v.pizzeria_id) AS v ON p.id = v.person_id
ORDER BY person_name, visit_date, pizzeria_name