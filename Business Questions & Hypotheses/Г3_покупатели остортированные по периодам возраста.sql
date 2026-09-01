with age_totals as (
    select
        customer_age_group,
        count(order_id) as total_orders
    from sales
    group by customer_age_group
)

select
    s.customer_age_group,
    p.category,
    count(s.order_id) as orders_count,
    round(count(s.order_id) * 100.0 / t.total_orders, 2) as category_share_percent,
    to_char(sum(total_amount), 'FM999,999,999,999,999') as total_revenue
from sales s
join products p on s.product_id = p.product_id
join age_totals t on s.customer_age_group = t.customer_age_group
group by s.customer_age_group, p.category, t.total_orders
order by s.customer_age_group, category_share_percent desc