select *
from {{ source('adw_sales', 'shipmethod') }}