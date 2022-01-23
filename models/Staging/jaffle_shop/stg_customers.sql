with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from {{ source('jaffle_shop', 'customers') }}
    -- substitute raw.jaffle_shop.customers by jaffle_shop source on src_jaffle_shop.yml
)

select * from customers