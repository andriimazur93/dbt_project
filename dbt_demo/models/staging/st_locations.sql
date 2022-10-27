with source as (
    select * from {{ ref('locations') }}
),
stage_locations as (
    select 
      location_id
      , street_address
      , postal_code
      , city
      , state_province
      , country_id
      , created_on
      , updated_on
    from source
)
select * from stage_locations