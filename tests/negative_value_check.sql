with 
price_check as (
    select * from {{ ref('dim_vehicle_detail')}}

)
select "Ex_Showroom_Price", "Battery", "Electric_Range", "Number_Of_Wheel" FROM price_check 
where "Ex_Showroom_Price" < 0 or "Battery" < 0
or "Electric_Range" < 0 or ("Number_Of_Wheel"<0 or "Number_Of_Wheel"=0 or "Number_Of_Wheel"=1)
