with
email_check as (
    select * from {{ ref('dim_customer_detail')}}
)

select "Email" from email_check
where  "Email" not like '%_@__%.__%'