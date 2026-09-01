With gen AS(
select
customer_id,
city,
sum(total_amount) as total,
row_number() OVER(PARTITION BY city ORDER BY sum(total_amount)) as top_of_total_amount
from sales
group BY
customer_id,
city
-- это штука находит просто сумму покупок определенного клиента и показывает город. 
-- теперь мне надо сделать так, чтобы показывался топ - 5 среди каждого города. 
)
Select
* from gen
where 
    top_of_total_amount <= 5