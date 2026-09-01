/*
Для каждого товара, отсортированного по дате продажи, найди рейтинг,
который был поставлен следующему по времени заказу этого же товара -
можно попробовать проверить, ухудшается ли рейтинг у товара со временем.
*/
select
    product_id,
    order_date,
    rating as current_rating,
    lead(order_date, 1) over (partition by product_id order by order_date) as next_order_date
from sales