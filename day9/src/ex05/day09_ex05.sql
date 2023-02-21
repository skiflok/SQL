

drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

drop function if exists fnc_persons();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar = 'female')
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
AS
$$
SELECT *
FROM person
WHERE gender IN ($1);
$$
    LANGUAGE sql;

SELECT *
FROM fnc_persons('male');

SELECT *
FROM fnc_persons();
