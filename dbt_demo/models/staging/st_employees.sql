with source as (
    select * from {{ ref('employees') }}
),
stage_employees as (
    select
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id,
        created_on,
        updated_on
    from source
)
select * from stage_employees