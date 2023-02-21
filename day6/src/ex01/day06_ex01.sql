-- Пожалуйста, напишите оператор DML ( INSERT INTO ... SELECT ...),
-- который вставляет новые записи в person_discounts таблицу на основе следующих правил.

-- взять агрегированное состояние по столбцам person_id и pizzeria_id
--
-- рассчитать величину персональной скидки по следующему псевдокоду:

-- if “amount of orders” = 1 then “discount” = 10.5 else if “amount
-- of orders” = 2 then “discount” = 22 else “discount” = 30

-- чтобы сгенерировать первичный ключ для таблицы person_discounts,
-- используйте приведенную ниже конструкцию SQL (эта конструкция взята из области SQL WINDOW FUNCTION).
--
-- ... ROW_NUMBER( ) OVER ( ) AS id ...

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER ( ) AS id,
       person_id,
       pizzeria_id,
       CASE
           WHEN count(person_id) = 1 THEN 10.5
           WHEN count(person_id) = 2 THEN 22
           ELSE 30
           END               AS discount
FROM person_order
         JOIN menu m on m.id = person_order.menu_id
GROUP BY person_id, pizzeria_id;

