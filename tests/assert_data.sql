with 
price as (
    select * from {{ ref('dim_vehicle_detail')}}

)
select "Ex_Showroom_Price" FROM price 
where "Ex_Showroom_Price" < 0
