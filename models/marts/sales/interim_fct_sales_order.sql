with sales_order_header as(
    select 
        sales_order_id,
        revision_number,
        order_date,
        due_date,
        ship_date,
        status,
        online_order_flag,
        sales_order_number,
        purchase_order_number,
        account_number,
        customer_id,
        sales_person_id,
        territory_id,
        bill_to_address_id,
        ship_to_address_id,
        ship_method_id,
        credi_card_id,
        credit_card_approval_code,
        currency_rate_id,
        subtotal,
        taxamt,
        freight,
        total_due
    from 
        {{ ref('stg_adw_sales__salesorderheader') }}
),
sales_order_detail as (
    select 
        sales_order_id,
        sales_order_detail_id,
        carrier_tracking_number,
        order_qty,
        product_id,
        special_offer_id,
        unit_price_discount,
        line_total
    from 
        {{ ref('stg_adw_sales__salesorderdetails') }}
)
select 
    *
from
    sales_order_header as soh
inner join sales_order_detail as sod on soh.sales_order_id=sod.sales_order_id
