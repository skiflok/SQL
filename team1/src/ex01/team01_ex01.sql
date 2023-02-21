
insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

with t1 as (
    select user_id, money, id, max(c.updated), type
    from balance b
             join currency c on c.updated <= b.updated and c.id = currency_id
    group by money, id, user_id, type
),
     t2 as (
         select user_id, money, id, min(c.updated) as min_cur_up, type
         from balance b
                  join currency c on c.updated > b.updated and c.id = currency_id
         group by money, id, user_id, type
     ),
     nt as (
         select user_id, money, id, type
         from t2
         except
         select user_id, money, id, type
         from t1
     ),
     res as (
         select nt.user_id, nt.money, nt.id, min_cur_up, nt.type
         from nt
                  join t2 on t2.type = nt.type and t2.user_id = nt.user_id
         union
         select *
         from t1
         order by min_cur_up
     )
select coalesce(u.name, 'not defined')     as name,
       coalesce(u.lastname, 'not defined') as lastname,
       c.name                              as currency_name,
       money * rate_to_usd                 as currency_in_usd
from res
         left join currency c on c.id = res.id and min_cur_up = c.updated
         left join public.user u on u.id = user_id
order by 1 desc, 2, 3;