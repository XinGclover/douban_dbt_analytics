select
    comment_id,
    user_id,
    drama_id,
    comment_time,
    coalesce(rating, 0) as rating,
    comment,
    ip_location,
    length(comment) as comment_length
    
from {{ ref('stg_comments') }}
where user_id is not null