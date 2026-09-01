/* 
Найди топ-3 самых дорогих заказа в каждом городе (по Total_Amount).
*/

SELECT 
*
from (
select
order_id,
total_amount,
city,
row_number() over(PARTITION BY city order by total_amount desc) as expensive_orders
from sales
) abi 
WHERE abi.expensive_orders <= 3