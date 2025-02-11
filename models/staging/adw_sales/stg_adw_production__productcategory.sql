with 

source as (

    select * from {{ source('adw_sales', 'productcategory') }}

),

renamed as (

    select
        productcategoryid as product_category_id,
        name as name,
        rowguid as rowguid,
        modifieddate as modified_date

    from source

)

select * from renamed
