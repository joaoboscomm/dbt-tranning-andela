with orders as (
    
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source ('jaffle_shop','orders')}}
    -- substitute raw.jaffle_shop.orders by jaffle_shop source on src_jaffle_shop.yml
)

select * from orders