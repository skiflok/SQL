create or replace function fnc_fibonacci(pstop integer default 10)
returns table (a integer)
as $$
with recursive r(a, b) as (
  select 0::integer, 1::integer
  union all
  select b, a + b from r where b < pstop
)
select a from r;
$$
language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();