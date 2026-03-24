select
    g.group_id,
    g.group_name,
    g.group_who,
    g.is_active,
    count(distinct m.user_id) as observed_member_count
from {{ ref('int_groups') }} g
left join {{ ref('stg_group_member_users') }} m
    on g.group_id = m.group_id
group by
    g.group_id,
    g.group_name,
    g.group_who,
    g.is_active