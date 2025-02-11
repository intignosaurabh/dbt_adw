with 

source as (

    select * from {{ source('adw_sales', 'productsubcategory') }}

),

renamed as (

    select
        productsubcategoryid as product_subcategory_id,
        productcategoryid as product_category_id,
        name as name,
        rowguid as rowguid,
        modifieddate as modified_date

    from source

)

select * from renamed
