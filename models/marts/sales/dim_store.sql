with store as(
     select
        business_entity_id,
        name,
        sales_person_id

    from {{ ref('stg_adw_sales__store') }}
)
,person as (
    select
        businessentityid as sales_person_id,
        persontype as person_type,
        firstname as first_name,
        lastname as last_name
    from
        {{ ref('stg_adw_person__person') }}
)
select
        row_number() over( order by st.business_entity_id) as store_key,
        st.business_entity_id,
        st.name as store_name,
        p.sales_person_id,
        p.first_name,
        p.last_name
from
    store as st
inner join person as p on st.sales_person_id=p.sales_person_id