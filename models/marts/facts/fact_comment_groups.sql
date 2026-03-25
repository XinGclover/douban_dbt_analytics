select  
    fc.comment_id,
    fc.user_id,
    fc.drama_id,
    fc.rating,
    fc.comment_time,
    fc.date_key,
    fc.time_key,
    fc.ip_location,
    fc.comment_length,
    bug.group_id,
    dg.group_name
from {{ ref('fact_comments') }} fc
left join {{ ref('bridge_user_groups') }} bug
    on fc.user_id = bug.user_id
left join {{ ref('dim_groups') }}  dg
    on bug.group_id = dg.group_id