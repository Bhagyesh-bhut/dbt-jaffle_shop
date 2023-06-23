WITH PAYEMENTS AS(
    SELECT
        ID AS payment_id,
        orderid AS order_id,
        paymentmethod as payment_method,
        STATUS AS PAYMENT_STATUS,
        amount / 100 as amount,
        created as created_at
    FROM 
        raw.jaffle_shop_raw.payment
)

SELECT * FROM PAYEMENTS



    where created_at > (select max(created_at) from ANALYTICS.DEV_STAGING.stg_payments)
    
