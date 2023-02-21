-- Чтобы соответствовать политикам управления данными,
-- необходимо добавить комментарии к таблице и столбцам таблицы.
-- Применим эту политику к person_discounts таблице.
-- Пожалуйста, добавьте комментарии на английском или русском языке
-- (на ваше усмотрение), объясняющие,
-- какова бизнес-цель таблицы и всех включенных в нее атрибутов.

COMMENT ON TABLE person_discounts IS 'the table contains information about personal discounts of visitors';
COMMENT ON COLUMN person_discounts.person_id IS 'id of visitors';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'pizzeria identifier';
COMMENT ON COLUMN person_discounts.discount IS 'personal discounts of visitors';
COMMENT ON COLUMN person_discounts.id IS 'unique identifier';