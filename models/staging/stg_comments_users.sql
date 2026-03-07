select distinct
    user_id,
    user_name,
    ip_location,
    comment_time as observed_at,
    drama_id,
    'comments'::varchar as source_table
from {{ ref('stg_comments') }}
where user_id is not null