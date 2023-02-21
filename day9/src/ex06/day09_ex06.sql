drop function if exists fnc_person_visits_and_eats_on_date(varchar, numeric, date);

CREATE OR REPLACE
    FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
                                                pprice numeric default 500,
                                                pdate date default '2022-01-08')
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
BEGIN
    return query
        WITH full_order AS (SELECT person_id, pizzeria_id, order_date, price
                            FROM person_order po
                                     JOIN menu m on m.id = po.menu_id)
        SELECT DISTINCT p.name AS pizzeria_name
        FROM full_order fo
                 JOIN person_visits pv ON
                    fo.pizzeria_id = pv.pizzeria_id
                AND fo.order_date = pv.visit_date
                AND fo.person_id = pv.person_id
                 JOIN pizzeria p on p.id = pv.pizzeria_id
                 JOIN person p2 on p2.id = pv.person_id
        WHERE p2.name = ($1)
          AND fo.price < ($2 / 1.0)
          AND fo.order_date = ($3);

END;
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
