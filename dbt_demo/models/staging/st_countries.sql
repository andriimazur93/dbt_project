with source as (
    select * from {{ ref('countries') }}
),
stage_countries as (
    select 
       country_id,
       country_name,   
       region_id,
       created_on,
       updated_on
    from source
)
select * from stage_countries