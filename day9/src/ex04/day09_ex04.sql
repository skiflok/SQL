-- 38.5. Функции на языке запросов (SQL)

drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons_female()
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
WHERE gender = 'female';
$$
    LANGUAGE sql;

SELECT *
FROM fnc_persons_female();


CREATE OR REPLACE FUNCTION fnc_persons_male()
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
WHERE gender = 'male';
$$
    LANGUAGE sql;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();