-- Пожалуйста, напишите оператор SQL, который возвращает идентификатор
-- меню и названия пиццы из таблицы меню, а также идентификатор человека
-- и имя человека из таблицы лиц в одном глобальном списке (с именами столбцов,
-- как показано в примере ниже), упорядоченными по столбцам object_id, а затем по столбцам object_name.

SELECT id AS object_id, name AS object_name
FROM person
UNION ALL
SELECT id AS object_id, pizza_name AS object_name
FROM menu
ORDER BY object_id, object_name