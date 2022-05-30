{{ config (
    materialized="table"
)}}



with dim_date as (

    select extract (year from "Date of Purchase") as year,
     extract (month from "Date of Purchase") as month,
     extract (day from "Date of Purchase") as day,
  "Date of Purchase" as date,
  quarter("Date of Purchase")as quarter
  from (select distinct "Date of Purchase" from {{source ('ev','EV_BUYERS_DATA')}})
  limit 50000000

)
select * from dim_date