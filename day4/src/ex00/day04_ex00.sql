-- Пожалуйста, создайте 2 представления базы данных
-- (с такими же атрибутами, как исходная таблица) на основе простой фильтрации по полу людей.
-- Установите соответствующие имена для представлений базы данных:
-- v_persons_female и v_persons_male.

CREATE VIEW v_persons_female AS
SELECT * FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT * FROM person
WHERE gender = 'male';
