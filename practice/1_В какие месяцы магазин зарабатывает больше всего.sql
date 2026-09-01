select 
    to_char(order_date::date, 'FMMonth') as month,
    to_char(sum(total_amount), 'FM999,999,999') as total_revenue
from sales
group BY 
    to_char(order_date::date, 'FMMonth'),
    EXTRACT(MONTH from order_date::date)
order BY
    total_revenue desc