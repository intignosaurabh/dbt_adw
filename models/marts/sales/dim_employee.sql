with employee as(
    select
        business_entity_id,
        national_id_number,
        organization_level,
        job_title,
        birth_date,
        maritial_status,
        gender,
        hire_date,
        salaried_flag,
        vacation_hours,
        sick_leave_hours,
        current_flag

    from {{ ref('stg_adw_hr__employee') }}
)
select *
from employee