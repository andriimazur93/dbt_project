with st_jobs as (
    select *
    from {{ ref('st_jobs') }}
)
select 
    job_id
    , job_title
    , min_salary
    , max_salary
from st_jobs