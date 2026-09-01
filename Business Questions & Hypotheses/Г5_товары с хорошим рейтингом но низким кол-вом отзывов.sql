/*
Менеджер по продукту просит:
 "Найди товары, у которых оценка выше средней оценки по всей базе,
но при этом количество отзывов у них меньше среднего количества отзывов по базе - это могут быть недооценённые товары."
*/
select
    product_id,
    avg(rating) as avg_rating,
    count(rating) as count_of_rating
FROM
     sales
GROUP BY
    product_id
having 
avg(rating) > 
        (select avg(avg_rating) from 
        (
        select
            avg(rating) as avg_rating
        from
            sales
        GROUP BY
        product_id
        ) a
        )
and count(rating) <
    
    (select
         avg(cnt) from
        (
        select
            count(rating) as cnt
        from
            sales
        GROUP BY
        product_id 
        ) b
    )
order BY
count_of_rating