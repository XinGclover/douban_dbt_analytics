with source as (

    select
        drama_id,
        actor_name
    from {{ ref('int_drama_actors_exploded') }}
    where actor_name is not null
      and actor_name != ''

),

joined as (

    select
        s.drama_id,
        a.actor_id
    from source s
    join {{ ref('dim_actors') }} a
      on s.actor_name = a.actor_name

)

select distinct
    drama_id,
    actor_id
from joined