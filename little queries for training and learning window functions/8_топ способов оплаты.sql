select
payment_mode,
count(payment_mode)
from 
sales
group BY
payment_mode
order by
count(payment_mode) desc