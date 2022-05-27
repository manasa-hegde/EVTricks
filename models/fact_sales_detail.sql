{{ config (
    materialized="table"
)}}

with dim_vehicle_detail as (

    select * from {{ ref('dim_vehicle_detail')}}

),

 fact_temp_sales as(
    select * from {{ ref('fact_temp_sales')}}
),


fact_sales_detail as (
    select c.customer_id,c.date,c.location_id,d.vehicle_id,d.unit_sold from 
    (select * from fact_temp_sales) as c join
    (select distinct t1.customer_id,t2.vehicle_id,count (t1.customer_id) as unit_sold from
    dim_customer_detail as t1 left join dim_vehicle_detail as t2 on t1."Make"=t2."Make" and t1."Model"=t2."Model" group by t1.customer_id ,t2.vehicle_id) as d
    on c.customer_id=d.customer_id
    limit 500000000
)

select * from fact_sales_detail