select 
    *
from
    {{ source('adw_sales', 'address') }}