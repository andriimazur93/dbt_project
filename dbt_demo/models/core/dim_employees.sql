with st_employees as (
    select *
    from {{ ref('st_employees') }}
)
select 
    employee_id
    , first_name
    , last_name
    , email
    , phone_number
    , cast(hire_date as Date) as hire_date
from st_employees