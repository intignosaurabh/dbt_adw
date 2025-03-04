with employee as(
    select
        row_number() over(order by business_entity_id) as employee_key,
        business_entity_id::NUMERIC as business_entity_id,
        national_id_number::NUMERIC as national_id_number,
        organization_level::NUMERIC as organization_level,
        job_title,
        birth_date::date as birth_date,
        case 
            when maritial_status = 'S' then 'Single'
            when maritial_status = 'M' then 'Married'
            else 'NA'
        end as maritial_status,
        case 
            when gender = 'M' then 'Male'
            when gender = 'F' then 'Female'
            else 'NA'
        end as gender,
        hire_date::date as hire_date,
        salaried_flag::boolean as salaried_flag,
        vacation_hours::NUMERIC as vacation_hours,
        sick_leave_hours::NUMERIC as sick_leave_hours,
        current_flag::boolean as current_flag,
        current_timestamp() as _record_created_at

    from {{ ref('stg_adw_hr__employee') }}
)
select *
from employee