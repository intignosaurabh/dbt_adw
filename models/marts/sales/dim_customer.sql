with customer as(
select
    CustomerID as customer_id,
    PersonID as person_id
from
    {{ ref('stg_adw_sales__customers') }}
),
person as(
select
    BusinessEntityID as business_entity_id,
    PersonType AS person_type,
    Title AS title,
    FirstName AS first_name,
    LastName AS last_name
from
    {{ ref('stg_adw_person__person') }}
)
select
    row_number() over(order by c.customer_id) as customer_key,
    c.customer_id,
    c.person_id,
    p.person_type,
    p.title,
    p.first_name,
    p.last_name
from
    customer as c
inner join person as p on c.person_id=p.business_entity_id