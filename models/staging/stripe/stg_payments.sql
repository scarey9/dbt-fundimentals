with payments as (

    select     
    
    ID as payment_id
	,ORDERID as order_id
	,PAYMENTMETHOD as payment_method
	,STATUS as payment_status
	,(AMOUNT / 100) as payment_amount
	,CREATED as payment_created
	,_BATCHED_AT as batched_at
    
    from  {{ source("stripe", "payment") }}
)

select * from payments