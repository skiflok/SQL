-- Пожалуйста, зарегистрируйте новые посещения ресторана
-- Domino's от Дениса и Ирины 24 февраля 2022 года.
-- Внимание : это упражнение, вероятно,
-- будет причиной неправильного изменения данных.
-- Собственно можно восстановить исходную модель БД с данными по ссылке в разделе
-- «Правила дня» и переиграть скрипт из Упражнений 07 и 08..

WITH t AS (SELECT pv.id pv_id, p.id p_id, p.name p_name, pz.id pz_id, pz.name pz_name
           FROM person_visits pv
                    JOIN person p on p.id = pv.person_id
                    JOIN pizzeria pz on pz.id = pv.pizzeria_id)

INSERT
INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(t.pv_id) FROM t) + 1,
        (SELECT DISTINCT t.p_id FROM t WHERE p_name = 'Denis'),
        (SELECT DISTINCT t.pz_id FROM t WHERE pz_name = 'Dominos'),
        '2022-02-24'),
       ((SELECT max(t.pv_id) FROM t) + 2,
        (SELECT DISTINCT t.p_id FROM t WHERE p_name = 'Irina'),
        (SELECT DISTINCT t.pz_id FROM t WHERE pz_name = 'Dominos'),
        '2022-02-24')