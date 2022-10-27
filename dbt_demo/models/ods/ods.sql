with st_employees as (
    select * from {{ ref('st_employees') }}
), st_departments as (
    select *
    from {{ ref('st_departments') }}
), st_locations as (
    select *
    from {{ ref('st_locations') }}
), st_countries as (
    select *
    from {{ ref('st_countries') }}
), st_regions as (
    select *
    from {{ ref('st_regions') }}
), st_jobs as (
    select *
    from {{ ref('st_jobs') }}
)
select 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    emp.email,
    emp.phone_number,
    emp.hire_date as start_date,
    NULL as end_date,
    emp.job_id,
    emp.manager_id,
    emp.department_id,
    dep.department_name,
    dep.location_id,
    loc.city,
    loc.state_province,
    con.country_name,
    reg.region_id,
    emp.salary,
    coalesce(emp.commission_pct, 0.0) as commission_pct
from st_employees emp
JOIN st_departments dep
    on dep.department_id = emp.department_id 
LEFT JOIN st_locations loc
    on loc.location_id = dep.location_id
LEFT JOIN st_countries con
    on con.country_id = loc.country_id
LEFT JOIN st_regions reg
    on reg.region_id = con.region_id
left join st_jobs job
    on job.job_id = emp.job_id