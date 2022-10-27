with st_employees as (
    select *
    from {{ ref('st_employees') }}
)
 select 
    mgr.employee_id as manager_id
    , mgr.first_name
    , mgr.last_name
    , mgr.email
    , mgr.phone_number
    , cast(mgr.hire_date as date) as hire_date
    from st_employees mgr
    where mgr.employee_id in(
        select manager_id 
        from st_employees
        group by manager_id
    )
