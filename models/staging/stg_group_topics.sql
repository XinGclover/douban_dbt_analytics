with zhaoxuelu_group_topics as (

    select
        cast(topic_id as bigint) as topic_id,
        cast(title as varchar) as topic_title,
        cast(full_time as timestamp) as topic_time,
        cast(reply_count as integer) as reply_count,
        cast(group_id as bigint) as group_id,
        cast(group_name as varchar) as group_name,
        cast('朝雪录' as varchar) as key_word,
        cast(created_at as timestamp) as insert_time,
        cast('zhaoxuelu_group_topics' as varchar) as source_name
    from {{ source('raw', 'zhaoxuelu_group_topics') }}

),

other_group_topics as (

    select
        cast(topic_id as bigint) as topic_id,
        cast(title as varchar) as topic_title,
        cast(full_time as timestamp) as topic_time,
        cast(reply_count as integer) as reply_count,
        cast(group_id as bigint) as group_id,
        cast(group_name as varchar) as group_name,
        cast(key_word as varchar) as key_word,
        cast(created_at as timestamp) as insert_time,
        cast('other_group_topics' as varchar) as source_name
    from {{ source('raw', 'other_group_topics') }}

)

select *
from zhaoxuelu_group_topics

union all

select *
from other_group_topics