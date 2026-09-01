/*
Проранжируй товары внутри каждой категории по среднему рейтингу (от лучшего к худшему).
Если у двух товаров одинаковый рейтинг - подумай, что должно произойти с их местом в ранжировании и с местом следующего за ними товара
 - именно это отличает RANK от ROW_NUMBER.
*/
SELECT
product_id,
product_name,
category,
dense_rank() OVER(PARTITION BY category order by avg_rating desc)
from products