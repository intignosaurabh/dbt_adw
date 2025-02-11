select
    *
from
    {{ source('adw_sales', 'person') }}