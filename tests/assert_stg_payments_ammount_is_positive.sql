with paymetns as (

    select * from {{ ref('stg_payments') }}
)


select
    order_id,
    sum(payment_amount) as total_amount
from paymetns
group by order_id
having not(total_amount >= 0)