-- Пожалуйста,
-- -- используйте 2 представления базы данных из упражнения №00 и напишите SQL,
-- -- чтобы получить имена мужчин и женщин в одном списке.
-- -- Пожалуйста, установите порядок по имени человека.
-- -- Образец данных представлен ниже.
-- --
-- -- name
-- -- Andrey
-- -- Anna
-- -- ..

SELECT name FROM v_persons_male
UNION
SELECT name FROM v_persons_female
ORDER BY name