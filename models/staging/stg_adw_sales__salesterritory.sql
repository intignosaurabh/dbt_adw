select *
from {{ source('adw_sales', 'salesterritory') }}