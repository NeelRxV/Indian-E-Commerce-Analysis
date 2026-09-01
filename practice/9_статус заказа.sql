select 
order_status,
count(order_status)
from 
sales
GROUP BY
order_status
order BY
count(order_status) desc