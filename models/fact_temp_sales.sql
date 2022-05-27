{{ config (
    materialized="table"
)}}

with dim_customer_detail as (

    select * from {{ ref('dim_customer_detail')}}

),

dim_date as (

    select * from {{ ref('dim_date') }}

),

dim_location as (

     select * from {{ ref('dim_location') }}

),



fact_temp_sales as (

    select a.customer_id,a.date,b.location_id from 

    (select distinct t1.customer_id,t2.date from
    dim_customer_detail as t1 inner join dim_date as t2 on t1."Date of Purchase"=t2.date) as a
    join
    (select distinct t3.customer_id,t4.location_id from
    dim_customer_detail as t3 join dim_location as t4 on t3."State"=t4."State") as b on a.customer_id=b.customer_id
    limit 5000000
)

select * from fact_temp_sales