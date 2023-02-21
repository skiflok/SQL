BEGIN; --start a transaction block session#1
BEGIN; --start a transaction block session#2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --session#1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --session#2
SHOW TRANSACTION ISOLATION LEVEL; --session#1
SHOW TRANSACTION ISOLATION LEVEL; --session#2
SELECT SUM(rating) FROM pizzeria; --output  for Session #1
SELECT SUM(rating) FROM pizzeria; --output  for Session #2
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut'; --update rating of pizzeria 'Pizza Hut' for Session #2
COMMIT; -- commit the current transaction for Session #2
SELECT SUM(rating) FROM pizzeria; --output  for Session #1
COMMIT; -- commit the current transaction for Session #1
SELECT SUM(rating) FROM pizzeria; --output  for Session #1
SELECT SUM(rating) FROM pizzeria; --output  for Session #2