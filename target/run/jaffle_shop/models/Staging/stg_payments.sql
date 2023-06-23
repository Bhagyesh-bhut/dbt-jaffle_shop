-- back compat for old kwarg name
  
  begin;
    

        insert into ANALYTICS.DEV_STAGING.stg_payments ("PAYMENT_ID", "ORDER_ID", "PAYMENT_METHOD", "PAYMENT_STATUS", "AMOUNT", "CREATED_AT")
        (
            select "PAYMENT_ID", "ORDER_ID", "PAYMENT_METHOD", "PAYMENT_STATUS", "AMOUNT", "CREATED_AT"
            from ANALYTICS.DEV_STAGING.stg_payments__dbt_tmp
        );
    commit;