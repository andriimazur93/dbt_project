with st_locations as (
    select *
    from {{ ref('st_locations') }}
),
st_countries as (
    select *
    from {{ ref('st_countries') }}
),
st_regions as (
    select *
    from {{ ref('st_regions') }}
)
select 
    loc.location_id
            , loc.street_address
            , loc.postal_code
            , loc.city
            , loc.state_province
            , country.country_name
            , reg.region_name
        from st_locations loc
        join st_countries country
        on loc.country_id = country.country_id
        join st_regions reg
        on reg.region_id = country.region_id