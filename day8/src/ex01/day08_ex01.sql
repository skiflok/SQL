BEGIN; --start a transaction block session#1
BEGIN; --start a transaction block session#2
SHOW TRANSACTION ISOLATION LEVEL; --session#1
SHOW TRANSACTION ISOLATION LEVEL; --session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --output  for Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --output  for Session #2
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; --update rating of pizzeria 'Pizza Hut' for Session #1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --update rating of pizzeria 'Pizza Hut' for Session #2
COMMIT; -- commit the current transaction for Session #1
COMMIT; -- commit the current transaction for Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --output  for Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; --output  for Session #2