with source as (
    select * from {{ ref('jobs') }}
),
stage_jobs as (
    select 
      job_id,
      job_title,
      min_salary,
      max_salary,
      created_on,
      updated_on
    from source
)
select * from stage_jobs