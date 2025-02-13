with
source as (
    select *
    from {{ source('adw_sales', 'shipmethod') }}
),
renamed as(
    select
        shipmethodid as ship_method_id,
        name as name,
        shipbase as ship_base,
        shiprate as ship_rate,
        rowguid as rowguid,
        modifieddate as modified_date
    from
        source
)
select * from renamed