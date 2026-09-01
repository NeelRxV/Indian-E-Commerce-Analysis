/*
Для каждого товара отсортируй его заказы по дате и найди,
 какая была цена (Unit_Price) у предыдущей продажи этого же товара
  - пригодится, если хочешь проверить, менялась ли цена товара со временем.
*/

SELECT
product_id,
unit_price,
lag(unit_price,1) OVER(PARTITION BY product_id order by order_date)
from sales