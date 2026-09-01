SELECT
    p.category,
    to_char(sum(s.total_amount), 'FM999,999,999,999') as total_revenue
from 
    products p
join sales s on s.product_id = p.product_id
GROUP BY
    p.category
order BY
    sum(s.total_amount) desc