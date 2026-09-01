/*
Для каждого клиента найди дату его следующего заказа
 (в отличие от LAG, тут смотрим вперёд, а не назад).
  Если у клиента это был последний заказ - что должно получиться в этой колонке?
*/

select
customer_id,
order_date,
lead(order_date,1) OVER(PARTITION BY customer_id order by order_date) as next_order 
from sales