with stateprovince as (
    select
        sp.StateProvinceID as state_province_id,
        sp.StateProvinceCode as state_province_code,
        sp.IsOnlyStateProvinceFlag as is_only_state_province_glag,
        sp.Name as state_province_name,
        sp.CountryRegionCode as country_region_code,
        sp.TerritoryID as territory_id
    from
        {{ ref('stg_adw_person__stateprovince') }} as sp
),
countryregion as(
    select
        cr.Name as country_region_name,
        cr.CountryRegionCode as country_region_code
    from
        {{ ref('stg_adw_person__countryregion') }} as cr
),
salesterritory as(
    select
        st.TerritoryID as territory_id,
        st.Name AS territory_name,
        st.CountryRegionCode as country_region_code,
        st."Group" AS sales_group
    from
        {{ ref('stg_adw_sales__salesterritory') }} as st
),
address as (
    select
        a.AddressID as address_id,
	    a.AddressLine1 as address_line,
	    a.city as city,
	    a.PostalCode as postal_code,
        a.StateProvinceID as state_province_id
    from
        {{ ref('stg_adw_person__address') }} as a
)
select
        a.address_id,
        a.address_line,
        a.city,
        a.postal_code,
        sp.state_province_id,
        sp.state_province_code,
        sp.is_only_state_province_glag,
        sp.state_province_name,
        cr.country_region_name,
        st.territory_id,
        st.territory_name,
        st.country_region_code,
        st.sales_group
from
    address as a
inner join stateprovince as sp on a.state_province_id=sp.state_province_id
inner join countryregion as cr on sp.country_region_code=cr.country_region_code
inner join salesterritory as st on sp.territory_id=st.territory_id