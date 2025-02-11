with 

source as (

    select * from {{ source('adw_sales', 'product') }}

),

renamed as (

    select
        productid as product_id,
        name as name,
        productnumber as product_number,
        makeflag as make_flag,
        finishedgoodsflag as finished_goods_flag,
        color as color,
        safetystocklevel as safety_stock_level,
        reorderpoint as re_order_point,
        standardcost as standard_cost,
        listprice as list_price,
        size as size,
        sizeunitmeasurecode as size_unit_measure_code,
        weightunitmeasurecode as weight_unit_measure_code,
        weight as weight,
        daystomanufacture as days_to_manufacture,
        productline as product_line,
        class as class,
        style as style,
        productsubcategoryid as product_subcategory_id,
        productmodelid as product_model_id,
        sellstartdate as sell_start_date,
        sellenddate as sell_end_date,
        discontinueddate as discountinued_date,
        rowguid rowguid,
        modifieddate as modified_date

    from source

)

select * from renamed
