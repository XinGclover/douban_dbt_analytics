with source as (

  select *
  from {{ ref('stg_drama_info') }}

),

exploded as (

  select
      drama_id,
      trim(actor) as actor_name
  from source,
  unnest(actors) as actor

)

select distinct
  drama_id,
  actor_name
from exploded
where actor_name is not null
and actor_name != ''