select
    user_id,
    user_name,
    ip_location,
    first_seen_at,
    last_seen_at
from {{ ref('int_all_users') }}
where user_id is not null