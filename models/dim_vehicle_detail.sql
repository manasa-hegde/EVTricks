{{ config (
    materialized="table"
)}}


with dim_vehicle_detail as(
      SELECT row_number() over (order by "Make","Model") as vehicle_id, * from DEV_EV_DB.DEV_RAW_SCHEMA.ev_data
    limit 50000
)
select * from dim_vehicle_detail
