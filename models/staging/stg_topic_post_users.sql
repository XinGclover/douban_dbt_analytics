with source as (

    select *
    from {{ source('raw', 'douban_topic_post_raw') }}

)

select distinct
    cast(user_id as varchar) as user_id,
    cast(user_name as varchar) as user_name,
    cast(ip_location as varchar) as ip_location,
    cast(pubtime as timestamp) as observed_at,
    topic_id as topic_id,
    cast('douban_topic_post_raw' as varchar) as source_table

from source
where user_id is not null