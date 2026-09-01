SELECT
    to_char(order_date::date, 'Day') as weekday_name,
    count(order_date) as count_of_orders
from sales
group BY
    to_char(order_date::date, 'Day')
order BY
count_of_orders desc