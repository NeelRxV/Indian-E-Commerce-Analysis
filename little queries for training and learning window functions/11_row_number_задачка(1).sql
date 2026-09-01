select
customer_id,
row_number() OVER(PARTITION BY customer_id order by order_id )
from
sales