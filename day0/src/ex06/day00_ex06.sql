-- Пожалуйста, используйте конструкцию SQL из упражнения 05
-- и добавьте новый вычисляемый столбец (используйте имя столбца «имя_проверки»)
-- с оператором проверки (псевдокод для этой проверки представлен ниже) в предложении SELECT.

-- if (person_name == 'Denis') then return true
--     else return false

SELECT (SELECT name FROM person WHERE id = person_order.person_id) AS NAME,
       (SELECT CASE WHEN name = 'Denis' THEN true ELSE false END AS check_name
        FROM person
        WHERE id = person_order.person_id)
FROM person_order
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18)
  AND order_date = '2022-01-07'