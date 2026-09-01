-- доход от продаж по штатам
select 
    state,
    to_char(sum(total_amount), 'FM999,999,999,999')
from 
    sales
GROUP BY
    state
order BY
    sum(total_amount) desc