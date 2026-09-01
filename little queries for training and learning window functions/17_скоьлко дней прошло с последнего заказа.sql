/*
Для каждого клиента, у которого больше одного заказа, найди дату его предыдущего заказа рядом с датой текущего заказа
 - то есть в одной строке должны быть и "когда был этот заказ",
  и "когда был заказ перед ним".
   Дальше можно посчитать разницу между этими датами
    - сколько дней проходит между заказами одного клиента.
*/
with tabl AS(
SELECT
customer_id,
order_date,
lag(order_date,1) OVER (PARTITION BY customer_id ORDER BY order_date) as last_order
from sales
)
select
*,
order_date::date - last_order::date as days_passed_between_orders
from tabl
where last_order is not null