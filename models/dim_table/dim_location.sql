{{ config (
    materialized="table"
)}}


with dim_location as(
    select  row_number() over (order by "State") as location_id,"State" from (select  distinct "State"  from {{source ('ev','EV_BUYERS_DATA')}})
    limit 5000000
)
select * from dim_location