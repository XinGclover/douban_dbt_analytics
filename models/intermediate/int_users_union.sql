select
    user_id,
    user_name,
    ip_location,
    observed_at,
    source_table
from {{ ref('stg_comments_users') }}

union all

select
    user_id,
    user_name,
    ip_location,
    post_time as observed_at,
    source_table
from {{ ref('stg_topic_post_users') }}

union all

select
    user_id,
    user_name,
    cast(null as varchar) as ip_location,
    cast(null as timestamp) as observed_at,
    source_table
from {{ ref('stg_group_member_users') }}