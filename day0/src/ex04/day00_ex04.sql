-- Пожалуйста, сделайте оператор select,
-- который возвращает одно вычисляемое поле с именем «person_information» в одной строке,
-- как описано в следующем примере:
--
-- Anna (age:16,gender:'female',address:'Moscow')
--
-- Наконец, добавьте пункт упорядочения по вычисляемому столбцу в возрастающем режиме.
-- Обратите внимание на кавычки в формуле!

SELECT CONCAT(name, ' (age:', age,
              ',gender:''', gender,
              ''',address:''', address, ''')') AS person_information
FROM person
ORDER BY person_information