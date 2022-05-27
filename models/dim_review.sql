{{ config (
    materialized="table"
)}}

with dim_vehicle_detail as (

    select * from {{ ref('dim_vehicle_detail')}}

),

dim_review as(
    select T2.REVIEW_ID,T1.VEHICLE_ID,T2.MAKE,T2.MODEL,T2.NO_OF_WHEELS,
    T2.RANGE_RATING,T2.CHARGING_TIME_RATING, T2.BATTERY_RATING, T2.ERGONOMICS_RATING,
    T2.BUILD_RATING FROM
    (SELECT VEHICLE_ID, "Make","Model" from dim_vehicle_detail) T1
    JOIN
    (SELECT * FROM
    "DEV_EV_DB"."DEV_RAW_SCHEMA".FEEDBACK) T2
    ON T1."Make"=T2.MAKE AND T1."Model"=T2.MODEL
    limit 500000
)
select * from dim_review
      