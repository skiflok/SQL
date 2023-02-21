BEGIN; --start a transaction block session#1
BEGIN; --start a transaction block session#2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --session#1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --session#2
SHOW TRANSACTION ISOLATION LEVEL; --session#1
SHOW TRANSACTION ISOLATION LEVEL; --session#2

SELECT * FROM pizzeria WHERE id = 1; --output  for Session #1
SELECT * FROM pizzeria WHERE id = 2; --output  for Session #2

UPDATE pizzeria SET rating = 2.0 WHERE id = 1; --update rating of pizzeria 'Pizza Hut' for Session #1
UPDATE pizzeria SET rating = 3.0 WHERE id = 2; --update rating of pizzeria 'Pizza Hut' for Session #2
UPDATE pizzeria SET rating = 1.0 WHERE id = 2; --update rating of pizzeria 'Pizza Hut' for Session #1
UPDATE pizzeria SET rating = 4.0 WHERE id = 1; --update rating of pizzeria 'Pizza Hut' for Session #2

COMMIT; -- commit the current transaction for Session #1
COMMIT; -- commit the current transaction for Session #2

