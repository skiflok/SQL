-- Добавьте следующие правила ограничения для существующих столбцов
-- таблицы person_discounts.
--
-- Столбец person_id не должен быть NULL
-- (используйте имя ограничения ch_nn_person_id)

-- Столбец pizzeria_id не должен быть NULL
-- (используйте имя ограничения ch_nn_pizzeria_id)

-- столбец скидки не должен быть NULL
-- (используйте имя ограничения ch_nn_discount)

-- столбец скидки должен быть 0 процентов по умолчанию
-- столбец скидки должен находиться в диапазоне значений от 0 до 100
-- (используйте имя ограничения ch_range_discount)

ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id CHECK (person_id NOTNULL),
ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id NOTNULL),
ADD CONSTRAINT ch_nn_discount CHECK (discount NOTNULL),
ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100),
ALTER COLUMN discount SET DEFAULT 0;