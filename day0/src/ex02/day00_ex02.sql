-- Пожалуйста, сделайте 2 оператора выбора с разными синтаксисом,
-- которые возвращают список пиццерий (название пиццерии и рейтинг)
-- с рейтингом от 3,5 до 5 баллов (включая предельные баллы) и упорядоченные
-- по рейтингу пиццерии.
--
-- 1-й оператор select должен содержать знаки сравнения (<=, >=)
-- второй оператор выбора должен содержать ключевое слово BETWEEN

-- WHERE rating BETWEEN 3.5 AND 5 от до включительно

SELECT name, rating
FROM pizzeria
WHERE rating >= 3.5
  AND rating <= 5
ORDER BY rating;

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating