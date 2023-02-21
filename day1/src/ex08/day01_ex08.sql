-- Пожалуйста, перепишите оператор SQL из упражнения № 07,
-- используя конструкцию NATURAL JOIN.
-- Результат должен быть таким же, как в упражнении №07.

SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM (SELECT person_id AS id, order_date FROM person_order) AS po
         NATURAL JOIN person
ORDER BY order_date, person_information