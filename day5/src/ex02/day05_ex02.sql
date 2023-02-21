-- Пожалуйста,
-- создайте функциональный индекс B-Tree с именем idx_person_name
-- для имени столбца таблицы person.
-- Индекс должен содержать имена людей в верхнем регистре.
-- Пожалуйста, напишите и предоставьте любой SQL с доказательством
-- ( EXPLAIN ANALYZE), что индекс idx_person_name работает.

-- 11.7. Индексы по выражениям

CREATE INDEX idx_person_name
    ON person (upper(name));

SET ENABLE_SEQSCAN = off;
EXPLAIN ANALYZE
SELECT * FROM person WHERE (upper(name)) IS NOT NULL;
