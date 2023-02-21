-- Создайте частичный уникальный индекс BTree с
-- именем idx_person_order_order_date в person_order
-- таблице person_id и menu_id атрибутами с частичной
-- уникальностью для order_date столбца на дату «2022-01-01».
-- Команда EXPLAIN ANALYZE должна вернуть следующий шаблон

-- Index Only Scan using idx_person_order_order_date on person_order …

CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan =off;

EXPLAIN ANALYZE
SELECT person_id, menu_id
    FROM person_order
        WHERE order_date = '2022-01-01';
