with groups_base as (

    select
        cast(group_id as integer) as group_id,
        group_name,
        group_who,
        is_active
    from {{ ref('stg_groups') }}

),

groups_from_topics as (

    select distinct
        cast(group_id as integer) as group_id,
        group_name,
        cast(null as varchar) as group_who,
        true as is_active
    from {{ ref('stg_group_topics') }}
    where group_id is not null

),

unioned as (

    select * from groups_base
    union all
    select * from groups_from_topics

),

deduped as (

    select
        group_id,
        group_name,
        group_who,
        is_active,
        row_number() over (
            partition by group_id
            order by
                case when group_who is not null then 1 else 2 end,
                case when is_active is not null then 1 else 2 end
        ) as rn
    from unioned
    where group_id is not null

)

select
    group_id,
    group_name,
    group_who,
    is_active
from deduped
where rn = 1