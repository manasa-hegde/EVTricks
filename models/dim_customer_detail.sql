{{ config (
    materialized="table"
)}}


with dim_customer_detail as(
    SELECT row_number() over (order by "Name","Email") as customer_id,"Make","Model","Date of Purchase","Name","Email","Gender","Age","State" FROM {{source ('ev','EV_BUYERS_DATA')}}
     limit 5000000000
)

select * from dim_customer_detail
