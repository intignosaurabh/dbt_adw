select *
from {{ source('adw_sales', 'stateprovince') }}