-- Измените оператор SQL из «упражнения 00», удалив столбец object_id.
-- Затем измените порядок по object_name для части данных из таблицы person,
-- а затем из таблицы меню (как показано в примере ниже). Пожалуйста, сохраняйте дубликаты!

SELECT name AS object_name
FROM person
UNION ALL
SELECT pizza_name AS object_name
FROM menu
ORDER BY object_name