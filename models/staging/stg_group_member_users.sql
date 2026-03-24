select distinct
    cast(member_id as varchar) as user_id,
    cast(member_name as varchar) as user_name,
    group_id as group_id,
    'douban_group_members' as source_table
from {{ source('raw', 'douban_group_members') }}
where member_id is not null