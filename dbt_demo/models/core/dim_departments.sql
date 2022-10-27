with st_departments as (
    select *
    from {{ ref('st_departments') }}
)
select 
    dep.department_id
    , dep.department_name
from st_departments dep