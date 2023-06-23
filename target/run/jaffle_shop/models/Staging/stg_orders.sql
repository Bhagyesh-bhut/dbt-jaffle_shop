-- back compat for old kwarg name
  
  begin;
    

        insert into ANALYTICS.DEV_STAGING.stg_orders ("ORDER_ID", "USER_ID", "ORDER_DATE", "ORDER_STATUS", "_ETL_LOADED_AT")
        (
            select "ORDER_ID", "USER_ID", "ORDER_DATE", "ORDER_STATUS", "_ETL_LOADED_AT"
            from ANALYTICS.DEV_STAGING.stg_orders__dbt_tmp
        );
    commit;