-- Перед дальнейшими шагами напишите оператор SQL,
-- который возвращает названия пицц и соответствующих им пиццерий.
-- Пожалуйста, взгляните на пример результата ниже (сортировка не требуется).

-- pizza_name      pizzeria_name
-- cheese pizza    Pizza Hut

-- Давайте предоставим доказательства того, что ваши индексы работают для вашего SQL.
-- Образец доказательства — это вывод команды EXPLAIN ANALYZE.
-- Пожалуйста, взгляните на пример команды вывода.

SET ENABLE_SEQSCAN = off;
EXPLAIN ANALYZE
SELECT pizza_name, p.name AS pizzeria_name
FROM menu
         JOIN pizzeria p on p.id = menu.pizzeria_id