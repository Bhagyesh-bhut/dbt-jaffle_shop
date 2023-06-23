with orders as  (
    select * from ANALYTICS.DEV_STAGING.stg_orders
),

payments as (
    select * from ANALYTICS.DEV_STAGING.stg_payments
),

customers as (
    select * from ANALYTICS.DEV_STAGING.stg_customers
),

completed_orders as (
    select
        *
    from 
        orders
    where 
        ORDER_STATUS='completed'
),

success_payements as (
    select 
        *
    from
        payments
    where
        PAYMENT_STATUS='success'
),

final_orders as(
    select 
        order_id as order_id,
        USER_ID as customer_id,
        order_date,
        amount,
        payment_method
    from
        completed_orders
    join success_payements using(order_id)
)

select * from final_orders