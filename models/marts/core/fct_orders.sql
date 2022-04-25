with orders as (

  select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}
),

fct_orders as (

    select 

    orders.order_id
    , orders.cusomer_id
    , payments.amount as amount

    from orders

    left join payments using (order_id)
)

select * from fct_orders
