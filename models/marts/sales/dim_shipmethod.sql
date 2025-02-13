with shipmethod as(
    select
        ship_method_id,
        name,
        ship_base,
        ship_rate
    from
        {{ ref('stg_adw_purchasing__shipmethod') }}
)
select
    *
from
    shipmethod