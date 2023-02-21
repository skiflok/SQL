-- Найдите имена всех лиц женского пола старше 25 лет и упорядочите результат по имени.
-- Образец вывода представлен ниже.

-- name
-- Elvira

SELECT name
FROM person
WHERE age > 25
  AND gender = 'female'
ORDER By name