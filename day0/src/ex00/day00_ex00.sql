-- Пожалуйста, сделайте оператор select,
-- который возвращает все имена и возраст людей из города «Казань».

-- SELECT выбор клонки
-- FROM откуда(таблица)
-- WHERE условие

SELECT name, age
FROM person
WHERE address = 'Kazan'