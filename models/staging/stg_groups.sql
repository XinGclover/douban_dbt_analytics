select
    cast(group_id as integer) as group_id,
    nullif(trim(cast(group_name as varchar)), '') as group_name,
    nullif(trim(cast(group_who as varchar)), '') as group_who,
    cast(is_active as boolean) as is_active
from {{ source('raw', 'douban_groups') }}