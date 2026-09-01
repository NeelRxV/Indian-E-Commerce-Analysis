SELECT
customer_tier,
avg(total_spent) as average_spent,
min(total_spent) as min_spent,
max(total_spent) as max_spent,
    case
        when total_spent >50000 and total_spent<=150000 then 'Entry Platinum'
        when total_spent >150000 and total_spent<=300000 then 'Strong Platinum'
        when total_spent >300000 and total_spent<=500000 then 'Best Platinum'
        when total_spent >500000 then 'VIP'
        else 'Not Platinum'
    end as platinum_segment
from customers
group BY
customer_tier,
platinum_segment
order BY
average_spent desc