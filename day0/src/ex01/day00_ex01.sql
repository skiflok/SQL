-- Пожалуйста, сделайте оператор select,
--  который возвращает имена и возраст для всех женщин из города «Казань».
--   Да, и, пожалуйста, отсортируйте результат по имени.

-- ORDER BY сортировка по возрастанию

SELECT name, age
FROM person
WHERE address = 'Kazan'
  AND gender = 'female'
ORDER BY name