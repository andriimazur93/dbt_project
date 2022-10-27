with source as (
    select * from {{ ref('departments') }}
),
stage_departments as (
    select
        department_id,
        department_name,
        manager_id,
        location_id,
        created_on,
        updated_on
    from source
)
select * from stage_departments