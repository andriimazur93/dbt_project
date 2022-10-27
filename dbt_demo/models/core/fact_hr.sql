with ods as (
    select * from {{ ref('ods') }}
), dim_employees as (
    select * from {{ ref('dim_employees') }}
), dim_managers as (
    select * from {{ ref('dim_managers') }}
), dim_jobs as (
    select * from {{ ref('dim_jobs') }}
), dim_departments as (
    select * from {{ ref('dim_departments') }}
), dim_locations as (
    select * from {{ ref('dim_locations') }}
)
select 
    dim_emp.employee_id as employees_dim_key
    , coalesce(dim_managers.manager_id, 0) as manager_dim_key
    , dim_jobs.job_id as job_dim_key
    , coalesce(dim_dep.department_id, 0) as departments_dim_key
    , coalesce(dim_loc.location_id, 0) as location_dim_key
    , ods.salary
    , ods.commission_pct
from ods
join dim_employees dim_emp
    on dim_emp.employee_id = ods.employee_id
    and cast(ods.start_date as Date) = dim_emp.hire_date
left join dim_managers
    on dim_managers.manager_id = ods.manager_id
left join dim_jobs
    on dim_jobs.job_id = ods.job_id
left join dim_departments dim_dep
    on dim_dep.department_id = ods.department_id
left join dim_locations dim_loc
    on dim_loc.location_id = ods.location_id