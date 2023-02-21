-- Пожалуйста, регистрируйте новые заказы от Дениса и Ирины на 24 февраля 2022 года
-- на новое меню с «сицилийской пиццей».
-- Предупреждение : это упражнение, вероятно,
-- будет причиной неправильного изменения данных.
-- Собственно, можно восстановить исходную модель
-- БД с данными по ссылке в разделе «Правила дня» и
-- переиграть скрипт из Упражнений 07, 08 и 09.

--

WITH t AS (SELECT DISTINCT po.id pv_id, p.id p_id, p.name p_name, m.id m_id, m.pizza_name m_pzname --*
           FROM person_order po
                    JOIN person p on p.id = po.person_id
                    RIGHT JOIN menu m on m.id = po.menu_id
           ORDER BY 1)
INSERT
INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT max(t.pv_id) FROM t) + 1,
        (SELECT DISTINCT t.p_id FROM t WHERE p_name = 'Denis'),
        (SELECT DISTINCT t.m_id FROM t WHERE m_pzname = 'sicilian pizza'),
        '2022-02-24'),
       ((SELECT max(t.pv_id) FROM t) + 2,
        (SELECT DISTINCT t.p_id FROM t WHERE p_name = 'Irina'),
        (SELECT DISTINCT t.m_id FROM t WHERE m_pzname = 'sicilian pizza'),
        '2022-02-24')