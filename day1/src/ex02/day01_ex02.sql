-- Пожалуйста, напишите оператор SQL,
-- который возвращает уникальные названия пицц из таблицы меню
-- и ORDER BY столбцу pizza_name в нисходящем режиме.
-- Пожалуйста, обратите внимание на раздел «Отказано».

SELECT pizza_name
FROM menu
UNION
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC