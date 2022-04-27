with payments as (

    select * from {{ref('stg_payments')}}
),

pivoted as (
select 

    order_id,
    {% for transaction_type in ["credit_card", "coupon", "bank_transfer", "gift_card"] -%}

        sum( case when payment_method = '{{transaction_type}}' then payment_amount else 0 end) as {{ transaction_type }}_amount 
        {%- if not loop.last -%}
        ,
        {% endif -%}
    {% endfor %}

from payments
where payment_status = 'success' 
group by order_id 
)

select * from pivoted