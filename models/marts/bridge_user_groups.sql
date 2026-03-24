select distinct
  user_id,
  group_id
from {{ ref('stg_group_member_users') }}
where user_id is not null
  and group_id is not null