with product as(
    select
        product_id,
        name,
        product_number,
        make_flag,
        finished_goods_flag,
        color,
        safety_stock_level,
        standard_cost,
        list_price,
        size,
        size_unit_measure_code,
        weight_unit_measure_code,
        weight,
        days_to_manufacture,
        product_line,
        class,
        style,
        product_subcategory_id

    from {{ ref('stg_adw_production__product') }}
    where product_subcategory_id != 'NULL'
),
subcategory as(
    select
        product_subcategory_id,
        product_category_id,
        name as product_subcategory

    from {{ ref('stg_adw_production__productsubcategory') }}
),
category as (
    select
        product_category_id,
        name as category

    from {{ ref('stg_adw_production__productcategory') }}
)
select
        row_number() over(order by product_id) as product_key,
        product_id,
        name,
        product_number,
        make_flag,
        finished_goods_flag,
        color,
        safety_stock_level,
        standard_cost,
        list_price,
        size,
        size_unit_measure_code,
        weight_unit_measure_code,
        weight,
        days_to_manufacture,
        product_line,
        class,
        style,
        sb.product_subcategory_id,
        sb.product_subcategory,
        c.product_category_id,
        c.category
from
    product as p
left join subcategory as sb on p.product_subcategory_id=sb.product_subcategory_id
left join category as c on sb.product_category_id = c.product_category_id