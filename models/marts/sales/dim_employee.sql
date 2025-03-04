with employee as(
    select
        row_number() over(order by business_entity_id) as employee_key,
        business_entity_id,
        national_id_number,
        organization_level,
        job_title,
        birth_date,
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
        hire_date,
        salaried_flag,
        vacation_hours,
        sick_leave_hours,
        current_flag

    from {{ ref('stg_adw_hr__employee') }}
)
select *
from employee