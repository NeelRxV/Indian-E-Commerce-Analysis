/*
Аналитик спрашивает:
 "Хочу увидеть, сколько дней в среднем проходит между датой заказа и датой доставки,
  и правда ли, что чем дольше доставка - тем ниже итоговая оценка заказа.
  Разбей результат по диапазонам сроков доставки: быстро, средне, долго - критерии выбери сам."
*/

with dayli AS(
SELECT
order_id,
product_id,
delivery_date::date - order_date::date as days_of_delivering,
rating as rating
from sales
),
test AS(
    SELECT
    product_id,
    avg(delivery_date::date - order_date::date) as avg_days_of_delivering
    from sales
    group BY
    product_id  
)
SELECT
avg(d.rating) as rating,
case
    when t.avg_days_of_delivering - d.days_of_delivering >= 1 then 'fast'
    when t.avg_days_of_delivering - d.days_of_delivering < 1 and t.avg_days_of_delivering - d.days_of_delivering > -1 then 'average'
    when t.avg_days_of_delivering - d.days_of_delivering <= -1 then 'long'
end as delivering_types
from dayli d 
join test t on t.product_id = d.product_id
group BY
delivering_types