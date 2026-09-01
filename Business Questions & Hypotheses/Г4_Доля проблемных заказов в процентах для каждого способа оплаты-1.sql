/*
Финансовый директор спрашивает:
 "Хочу понять, какие способы оплаты чаще всего связаны с отменёнными или возвращёнными заказами.
 Дай долю проблемных заказов в процентах для каждого способа оплаты."
*/
with gen AS 
(SELECT
    payment_mode,
    count(order_status) as gen_count
from
    sales
group BY
     payment_mode)




select
    s.payment_mode,
    s.order_status,
    round(((count(s.order_status)*100.0) / g.gen_count),2) as percentage_of_problem_orders
from
     sales s
join gen g on g.payment_mode = s.payment_mode
where
order_status in ('Cancelled', 'Returned')
group BY
    s.payment_mode,
    s.order_status,
    g.gen_count
/*
результат неожиданно ровный,
требует дополнительной проверки на предмет случайности генерации данных"
*/