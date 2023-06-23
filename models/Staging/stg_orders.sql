WITH ORDERS AS(
    SELECT
        ID AS order_id,
        USER_ID,
        ORDER_DATE,
        STATUS AS ORDER_STATUS,
        _ETL_LOADED_AT
    FROM 
        {{ source('jaffle_shop','orders') }}
)

SELECT * FROM ORDERS

{% if is_incremental() %}

    where _ETL_LOADED_AT > (select max(_ETL_LOADED_AT) from {{ this }})

{% endif %}