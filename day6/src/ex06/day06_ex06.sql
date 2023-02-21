-- Давайте создадим последовательность базы данных
-- с именем seq_person_discounts (начиная с 1 значения) и
-- установим значение по умолчанию для атрибута id таблицы,
-- чтобы каждый раз автоматически person_discounts принимать значение
-- .
-- seq_person_discounts Имейте в виду, что ваш следующий порядковый номер равен 1,
-- в этом случае установите фактическое значение для последовательности базы данных
-- на основе формулы «количество строк в таблице person_discounts» + 1.
-- В противном случае вы получите ошибки об ограничении нарушения первичного ключа.

CREATE SEQUENCE seq_person_discounts START 1;

SELECT setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');