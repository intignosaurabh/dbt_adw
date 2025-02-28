with shipmethod as(
    select
        row_number() over(order by ship_method_id) as ship_method_key,
        ship_method_id,
        name,
        ship_base,
        ship_rate
    from
        {{ ref('stg_adw_purchasing__shipmethod') }} as sh
)
select
    *
from
    shipmethod