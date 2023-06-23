WITH CUSTOMERS AS(
    SELECT
        ID AS C_ID,
        FIRST_NAME,
        LAST_NAME
    FROM 
        raw.jaffle_shop_raw.customers
)

SELECT * FROM CUSTOMERS