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
        ------------- ids
        soh.sales_order_id::NUMERIC as sales_order_id,
        sales_order_detail_id::NUMERIC as sales_order_detail_id,
        product_id::NUMERIC as product_id,
        customer_id::NUMERIC as customer_id,
        sales_person_id::NUMERIC as sales_person_id,
        territory_id::NUMERIC as territory_id,
        bill_to_address_id::NUMERIC as bill_to_address_id,
        ship_to_address_id::NUMERIC as ship_to_address_id,
        ship_method_id::NUMERIC as ship_method_id,
        credi_card_id::NUMERIC as credi_card_id,
        currency_rate_id::NUMERIC as currency_rate_id,
        special_offer_id::NUMERIC as special_offer_id,
        ------- date attributes
        order_date::date as order_date,
        due_date::date as due_date,
        ship_date::date as ship_date,
        ------ measureable attribute
        subtotal::DECIMAL(18,2) as subtotal,
        taxamt::DECIMAL(18,2) as taxamt,
        freight::DECIMAL(18,2) as freight,
        total_due::DECIMAL(18,2) as total_due,
        order_qty::NUMERIC as order_qty,
        unit_price_discount::DECIMAL(18,2) as unit_price_discount,
        line_total::DECIMAL(18,2) as line_total,
        ------ other attributes
        status,
        online_order_flag::boolean as online_order_flag,
        revision_number::NUMERIC as revision_number,
        sales_order_number,
        purchase_order_number,
        account_number,
        credit_card_approval_code,
        carrier_tracking_number,
from
    sales_order_header as soh
inner join sales_order_detail as sod on soh.sales_order_id=sod.sales_order_id
