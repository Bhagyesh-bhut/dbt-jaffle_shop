WITH ORDERS AS(
    SELECT
        ID AS order_id,
        USER_ID,
        ORDER_DATE,
        STATUS AS ORDER_STATUS,
        _ETL_LOADED_AT
    FROM 
        raw.jaffle_shop_raw.orders
)

SELECT * FROM ORDERS



    where _ETL_LOADED_AT > (select max(_ETL_LOADED_AT) from ANALYTICS.DEV_STAGING.stg_orders)

