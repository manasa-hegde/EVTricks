{{ config (
    materialized="table"
)}}


with dim_vehicle_detail as(
      SELECT row_number() over (order by "Make","Model") as vehicle_id, * from {{source ('ev','EV_DATA')}}
    limit 50000
)
select * from dim_vehicle_detail
