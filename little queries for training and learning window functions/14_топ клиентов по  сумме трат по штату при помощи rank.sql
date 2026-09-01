/*
Проранжируй клиентов по общей сумме трат (Total_Spent) отдельно внутри каждого штата
 - кто в своём штате тратит больше всех, кто на втором месте и так далее.
*/
SELECT
customer_name,
state,
rank() OVER(PARTITION BY state order by total_spent desc)
from customers