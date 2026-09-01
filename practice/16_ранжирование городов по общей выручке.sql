/*
Проранжируй города по общей выручке (сумме всех заказов в этом городе)
- без разбивки на категории, просто по всей базе сразу.
Если несколько городов дадут одинаковую сумму (маловероятно, но всё же)
- посмотри, как DENSE_RANK себя поведёт.
*/

SELECT
city,
sum(total_amount),
DENSE_RANK() OVER(order by total_amount desc) as ranking
from sales
GROUP BY
city,
total_amount