with 

source as (

    select * from {{ source('adw_sales', 'salesorderheader') }}

),

renamed as (

    select
        salesorderid as sales_order_id,
        revisionnumber as revision_number,
        orderdate as order_date,
        duedate as due_date,
        shipdate as ship_date,
        status as status,
        onlineorderflag as online_order_flag,
        salesordernumber as sales_order_number,
        purchaseordernumber as purchase_order_number,
        accountnumber as account_number,
        customerid as customer_id,
        salespersonid as sales_person_id,
        territoryid as territory_id,
        billtoaddressid as bill_to_address_id,
        shiptoaddressid as ship_to_address_id,
        shipmethodid as ship_method_id,
        creditcardid as credi_card_id,
        creditcardapprovalcode as credit_card_approval_code,
        currencyrateid as currency_rate_id,
        subtotal as subtotal,
        taxamt as taxamt,
        freight as freight,
        totaldue as total_due,
        comment as comment,
        rowguid as rowguid,
        modifieddate as modified_date

    from source

)

select * from renamed
