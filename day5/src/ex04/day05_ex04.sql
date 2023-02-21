-- Создайте уникальный индекс BTree с именем idx_menu_unique
-- в menu таблице  pizzeria_id и pizza_name столбцах.
-- Пожалуйста, напишите и предоставьте любой SQL с доказательством
-- ( EXPLAIN ANALYZE), что индекс idx_menu_uniqueработает.

CREATE UNIQUE INDEX idx_menu_unique
    ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = off;


EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 2
   OR pizza_name = 'sicilian pizza'

