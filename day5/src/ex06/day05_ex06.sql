-- Пожалуйста
-- , взгляните на приведенный ниже SQL
-- с технической точки зрения (игнорируйте логический вариант этого оператора SQL).

-- Создайте новый индекс BTree с именем, idx_1
-- которое должно улучшить показатель «Время выполнения» этого SQL.
-- Пожалуйста, предоставьте доказательство ( EXPLAIN ANALYZE) того, что SQL был улучшен.


DROP INDEX IF EXISTS idx_1;

CREATE INDEX IF NOT EXISTS idx_1
ON pizzeria (rating);

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
       max(rating)     OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;
