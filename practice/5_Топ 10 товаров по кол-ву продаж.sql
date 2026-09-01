-- Топ 10 товаров по кол-ву продаж
SELECT
p.product_name,
sum(quantity) as amount_of_sold
from products p
join sales s on s.product_id = p.product_id
group BY
p.product_name
order BY
amount_of_sold desc
limit 10