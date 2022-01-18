{{ config (
        
    materialized="table"
)


}}


with recent_order_status as (

    select status, count(*) from (
  
  select user_id, 
       rank() over (partition by user_id order by id desc) ranking,
       order_date date,
       status
from 
raw.jaffle_shop.orders
  )
  
  where ranking = 1
  group by 1
  order by 2 desc
)

select * from recent_order_status