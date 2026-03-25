with source as (

  select distinct
      actor_name
  from {{ ref('int_drama_actors_exploded') }}

),

cleaned as (

  select
      trim(actor_name) as actor_name
  from source
  where actor_name is not null
    and actor_name != ''

)

select
  {{ dbt_utils.generate_surrogate_key(['actor_name']) }} as actor_id,
  actor_name
from cleaned