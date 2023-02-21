-- Давайте обновим данные в нашем материализованном представлении
-- mv_dmitriy_visits_and_eats из упражнения №06.
-- Перед этим действием сгенерируйте еще одно посещение Дмитрия,
-- которое удовлетворяет предложению SQL материализованного представления,
-- за исключением пиццерии, которую мы видим в результате упражнения №06.
-- После добавления нового посещения обновите состояние данных для mv_dmitriy_visits_and_eats.


WITH pz_name AS (SELECT pizzeria_id, name AS pizzeria_name
                 FROM pizzeria
                          JOIN menu m ON pizzeria.id = m.pizzeria_id
                 WHERE price < 800
                   AND pizzeria_id NOT IN (SELECT pizzeria_id
                                           FROM person
                                                    JOIN person_visits pv ON person.id = pv.person_id
                                           WHERE name = 'Dmitriy'
                                             AND visit_date = '2022-01-08')
                 LIMIT 1)
INSERT
INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pz_name.pizzeria_id FROM pz_name),
        ('2022-01-08')
 );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats