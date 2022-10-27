with source as (
    select * from {{ ref('job_history') }}
),
stage_job_history as (
    select 
        employee_id,
        start_date,
        end_date,
        job_id,
        department_id,
        created_on,
        updated_on
    from source
)
select * from stage_job_history