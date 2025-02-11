select
    *
from
    {{ source('adw_sales', 'customer') }}