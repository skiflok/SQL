-- Пожалуйста, найдите союз пиццерий,
-- у которых есть заказы либо от женщин, либо от мужчин.
-- Другими словами, вы должны найти набор названий пиццерий,
-- заказанных только женщинами,
-- и выполнить операцию «СОЮЗ» с набором названий пиццерий,
-- заказанных только мужчинами.
-- Обратите внимание на слово «только» для обоих полов.
-- Для любых операторов SQL с наборами не сохраняются дубликаты
-- ( UNION, EXCEPT, INTERSECT).
-- Пожалуйста, отсортируйте результат по названию пиццерии.
-- Образец данных представлен ниже.
--
-- pizzeria_name
-- Papa Johns

WITH pv_m_pz AS
	(SELECT pizzeria.name AS pizzeria_name, person.gender AS gender FROM person_order
	    JOIN menu ON menu_id = menu.id
	    JOIN person ON person_id = person.id
	    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
SELECT DISTINCT pizzeria_name
    FROM pv_m_pz
    WHERE gender = 'male' AND pizzeria_name NOT IN (SELECT pizzeria_name FROM pv_m_pz WHERE gender = 'female')
UNION ALL
SELECT DISTINCT pizzeria_name
    FROM pv_m_pz
    WHERE gender = 'female' AND pizzeria_name NOT IN (SELECT pizzeria_name FROM pv_m_pz WHERE gender = 'male')
ORDER BY pizzeria_name