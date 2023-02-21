-- Пожалуйста,
-- найдите имена людей, которые живут по тому же адресу.
-- Убедитесь, что результат упорядочен по имени 1-го лица,
-- имени 2-го лица и общему адресу. Образец данных представлен ниже.
-- Пожалуйста, убедитесь, что ваши имена столбцов соответствуют именам столбцов ниже.

-- person_name1        person_name2        common_address
-- Andrey              Anna                Moscow
-- Denis               Kate                Kazan

WITH t_person AS (SELECT id, name, address FROM person)

SELECT person.name AS person_name1, t_person.name AS person_name2, person.address AS common_address
FROM person
         JOIN t_person ON person.address = t_person.address
WHERE person.name != t_person.name AND person.id > t_person.id
ORDER BY person_name1, person_name2, common_address