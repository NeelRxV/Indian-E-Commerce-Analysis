-- Топ 30 товаров по продажам
SELECT
p.product_name,
to_char(sum(s.total_amount), 'FM999,999,999,999') as total_revenue
from products p
join sales s on s.product_id = p.product_id
group BY
p.product_name
order BY
sum(s.total_amount) desc
limit 30