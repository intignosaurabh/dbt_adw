with 

source as (

    select * from {{ source('adw_sales', 'employee') }}

),

renamed as (

    select
        businessentityid as business_entity_id,
        nationalidnumber as national_id_number,
        loginid as login_id,
        organizationnode as organization_node,
        organizationlevel as organization_level,
        jobtitle as job_title,
        birthdate as birth_date,
        maritalstatus as maritial_status,
        gender as gender,
        hiredate as hire_date,
        salariedflag as salaried_flag,
        vacationhours as vacation_hours,
        sickleavehours as sick_leave_hours,
        currentflag as current_flag,
        rowguid as rowguid,
        modifieddate as modified_date,
        etl_load_date

    from source

)

select * from renamed
