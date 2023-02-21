--session#1
BEGIN; --start a transaction block
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --update rating of pizzeria 'Pizza Hut' session#1
COMMIT; -- commit the current transaction

--session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- output for Session #2