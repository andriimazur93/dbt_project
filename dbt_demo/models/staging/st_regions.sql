with source as (
    select * from {{ ref('regions') }}
),
stage_regions as (
    select 
      region_id,
      region_name,
      created_on,
      updated_on
    from source
)
select * from stage_regions