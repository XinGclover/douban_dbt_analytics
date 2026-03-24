with source as (

    select *
    from {{ source('raw', 'douban_topic_post_raw') }}

)

select
    cast(topic_id as bigint) as topic_id,
    cast(topic_title as varchar) as topic_title,
    cast(post_type as varchar) as post_type,
    cast(floor_no as integer) as floor_no,
    cast(topic_url as varchar) as topic_url,
    cast(user_id as varchar) as user_id,
    cast(user_name as varchar) as user_name,
    cast(is_op_author as boolean) as is_op_author,
    cast(content_text as varchar) as content_text,
    like_count,
    cast(pubtime as timestamp) as post_time,
    cast(ip_location as varchar) as ip_location,
    'douban_topic_post_raw' as source_table
from source
where user_id is not null