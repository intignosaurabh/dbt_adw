with 

source as (

    select 
        * 
    from 
        {{ source('adw_sales', 'salesorderdetail') }}

)
select
    salesorderid as sales_order_id,
    salesorderdetailid as sales_order_detail_id,
    CARRIERTRACKINGNUMBER as carrier_tracking_number,
    orderqty as order_qty,
    productid as product_id,
    specialofferid as special_offer_id,
    unitpricediscount as unit_price_discount,
    linetotal as line_total,
    rowguid as rowguid,
    modifieddate as modified_date
from
    source