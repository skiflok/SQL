-- Напишите оператор SQL,
-- чтобы увидеть, как рестораны группируются
-- по посещениям и заказам и соединяются друг с другом по имени ресторана.
-- Вы можете использовать внутренние SQL-запросы из упражнения 02
-- (рестораны по посещениям и по заказам) без ограничений по количеству строк.

-- Кроме того, пожалуйста, добавьте следующие правила.
--
-- подсчитать сумму заказов и посещений соответствующей пиццерии
-- (учтите, что не все ключи пиццерий представлены в обеих таблицах).
-- сортировать результаты по total_count столбцу по убыванию и по name возрастанию.
-- Взгляните на образец данных ниже.

WITH total AS (
    (SELECT name, count(name) as count, 'visit' AS action_type
     FROM person_visits
              JOIN pizzeria p on p.id = person_visits.pizzeria_id
     GROUP BY name
     ORDER BY count DESC)
    UNION
    (SELECT p.name, COUNT(name) as count, 'order' AS action_type
     FROM person_order
              join menu m on m.id = person_order.menu_id
              JOIN pizzeria p on p.id = m.pizzeria_id
     GROUP BY name
     ORDER BY count DESC))
SELECT name, sum(count) AS total_count FROM total
GROUP BY name
ORDER BY total_count DESC, name