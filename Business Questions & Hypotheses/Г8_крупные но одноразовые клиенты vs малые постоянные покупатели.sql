/*
Директор по продажам спрашивает:
"Есть подозрение, что у нас есть клиенты, которые сделали один крупный заказ и больше не возвращались,
и есть клиенты, которые заказывают часто, но по мелочи.
Раздели всех клиентов на эти две категории и покажи,
 сколько денег в сумме приносит каждая категория бизнесу."
*/
with customer_metrics AS (
    SELECT
        customer_id,
        count(order_id) as personal_order_count,
        avg(total_amount) as personal_avg_price,
        sum(total_amount) as personal_total_spent
    from sales
    group by customer_id
),
average_price AS(
    select
    avg(total_amount) as avrg_cheque
from 
    sales
),
average_number_of_orders AS(
    SELECT
    avg(count_of_orders_per_person) as final_count_of_orders from
    (
        SELECT
        count(order_id) as count_of_orders_per_person
from
    sales
group BY
    customer_id
) count_of_orders
),

final_query AS (
SELECT
    case
        when c.personal_order_count = 1 and c.personal_avg_price > p.avrg_cheque then 'один крупный заказ и больше не возвращались'
        when c.personal_order_count > a.final_count_of_orders and c.personal_avg_price < p.avrg_cheque then 'много заказов, но по мелочи'
        else 'прочее'
    end type_of_client,
    personal_total_spent
FROM
    sales s
cross join average_number_of_orders a
cross join average_price p
join customer_metrics c on c.customer_id = s.customer_id
group BY
    s.customer_id,
    a.final_count_of_orders,
    c.personal_order_count,
    c.personal_avg_price,
    p.avrg_cheque,
    c.personal_total_spent
)

SELECT
type_of_client,
sum(personal_total_spent) as total_revenue_per_category
from final_query 
group BY
type_of_client
order BY
total_revenue_per_category desc