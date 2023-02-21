create or replace function func_minimum(variadic arr numeric[])
returns numeric
as $$ select min(arr[i]) from generate_subscripts(arr, 1) a(i);$$
language SQL;

select func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);