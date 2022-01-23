/*
To create custom singular tests, you need to create a query that finds the opositive version of you actully wants.
For example, if i want to get all the payments that are not positive or equal to 0. To do it i need to create a query to 
get all the data that has amount < 0. 

Dbt needs this structure because it is configured to get if some data VIOLATES what is expected.
*/

with payments as (

select * 
from {{ ref ('stg_payments')}}

)

select order_id,
        sum(amount) total_amount
from payments
group by 1
having total_amount < 0 