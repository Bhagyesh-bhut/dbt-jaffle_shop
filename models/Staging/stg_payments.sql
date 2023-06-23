WITH PAYEMENTS AS(
    SELECT
        ID AS payment_id,
        orderid AS order_id,
        paymentmethod as payment_method,
        STATUS AS PAYMENT_STATUS,
        amount / 100 as amount,
        created as created_at
    FROM 
        {{ source('jaffle_shop','payment') }}
)

SELECT * FROM PAYEMENTS

{% if is_incremental() %}

    where created_at > (select max(created_at) from {{ this }})
    
{% endif %}

