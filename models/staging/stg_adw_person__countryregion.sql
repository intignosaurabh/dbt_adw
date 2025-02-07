select *
from {{ source('adw_sales', 'countryregion') }}