


with cte_customers as (
    select * from {{ref('stg_customers')}}
),
cte_orders as (
    select * from {{ref('stg_orders')}}
)


select 
    cte_customers.customer_id, 
    cte_customers.COUNTRY,
    cte_customers.CUSTOMER_NAME,
    cte_customers.EMAIL,
    cte_customers.SIGNUP_DATE,
    cte_orders.ORDER_DATE,
    cte_orders.ORDER_ID,
    cte_orders.PRODUCT_ID,
    cte_orders.QUANTITY
from cte_customers 
join cte_orders on cte_customers.customer_id = cte_orders.customer_id
WHERE cte_customers.COUNTRY = 'India' and YEAR(cte_customers.SIGNUP_DATE) = 2024 and MONTH(cte_customers.SIGNUP_DATE) in (1,2)