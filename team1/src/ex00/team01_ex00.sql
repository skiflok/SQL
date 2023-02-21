-- Пожалуйста, напишите оператор SQL,
-- который возвращает общий объем (сумму всех денег)
-- транзакций с баланса пользователя,
-- агрегированных по пользователю и типу баланса.
-- Имейте в виду, что все данные должны быть обработаны,
-- включая данные с аномалиями. Ниже представлена ​​
-- таблица столбцов результатов и соответствующая формула расчета.


-- name        lastname        type        volume      currency_name       last_rate_to_usd    total_volume_in_usd
-- Петр        not defined     2           203         not defined         1                   203


with max_u as (select max(c.updated) as max, c.name
from currency c
group by c.name)
select coalesce(u.name, 'not defined')           as name,
       coalesce(u.lastname, 'not defined')       as lastname,
       b.type                                    as type,
       sum(money)                                as volume,
       coalesce(c.name, 'not defined')           as currency_name,
       coalesce(c.rate_to_usd, '1')              as last_rate_to_usd,
       sum(money) * coalesce(c.rate_to_usd, '1') as total_volume_in_usd
from balance b
         full join public."user" u on u.id = b.user_id
         full join (select c.id, c.rate_to_usd, c.name
                          from currency c
                                   join max_u on max_u.name = c.name
                          where c.updated = max_u.max
group by c.id, c.rate_to_usd, c.name) as c
on b.currency_id = c.id
group by u.name, u.lastname, b.type, c.name, c.rate_to_usd
order by 1 DESC, 2, 3;