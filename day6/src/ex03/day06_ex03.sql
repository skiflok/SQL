-- На самом деле нам нужно улучшить согласованность данных с одной стороны
-- и настроить производительность с другой.
-- Создайте многостолбцовый уникальный индекс
-- (с именем idx_person_discounts_unique),
-- который предотвращает дублирование
-- парных значений идентификаторов человека и пиццерии.
-- После создания нового индекса предоставьте любую простую инструкцию SQL,
-- подтверждающую использование индекса (с помощью EXPLAIN ANALYZE).
-- Пример «доказательства» ниже
--
-- ...
-- Index Scan using idx_person_discounts_unique on person_discounts
-- ...

CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 1

