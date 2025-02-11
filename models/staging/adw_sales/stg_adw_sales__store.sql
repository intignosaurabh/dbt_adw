with 

source as (

    select * from {{ source('adw_sales', 'store') }}

),

renamed as (

    select
        businessentityid as business_entity_id,
        name as name,
        salespersonid as sales_person_id,
        demographics as demographics,
        rowguid as rowguid,
        modifieddate as modified_date

    from source

)

select * from renamed
