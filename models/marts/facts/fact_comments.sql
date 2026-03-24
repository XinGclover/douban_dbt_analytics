select
    comment_id,
    drama_id,
    user_id,   
    coalesce(rating, 0) as rating,
    comment,
    length(comment) as comment_length,
    like_count,
    to_char(comment_time,'YYYYMMDD')::int as date_key,
    to_char(comment_time, 'HH24MISS')::int as time_key,
    comment_time,
    ip_location,
    source_name    
from {{ ref('stg_comments') }}
where user_id is not null