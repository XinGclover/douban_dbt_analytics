select
    comment_id,
    user_id,
    drama_id,
    coalesce(rating, 0) as rating,
    comment,
    like_count,
    to_char(comment_time,'YYYYMMDD')::int as date_key,
    to_char(comment_time, 'HH24MISS')::int as time_key,
    ip_location,
    length(comment) as comment_length
    
from {{ ref('stg_comments') }}
where user_id is not null