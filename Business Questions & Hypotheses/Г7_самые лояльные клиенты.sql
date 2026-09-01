/*
Директор по клиентскому опыту просит:
 "Хочу увидеть эволюцию: для каждого клиента найди дату его самого первого заказа
  и дату его самого последнего заказа, а также сколько всего заказов он сделал за это время.
   Мне нужен список клиентов, отсортированный по количеству заказов, чтобы понять, кто самый лояльный."
*/

SELECT
customer_id,
min(order_date) first_date_of_order,
max(order_date) as last_date_of_order,
count(order_id) as count_of_orders
from sales
group BY
customer_id
order by
 count_of_orders desc