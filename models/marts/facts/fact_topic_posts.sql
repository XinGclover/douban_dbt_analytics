with source as (

    select *
    from {{ ref('stg_topic_post_users') }}

),

final as (

    select
      concat(topic_id, '_', post_type, '_', floor_no) as post_id,
      topic_id,
      user_id,
      post_time,
      cast(post_time as date) as date_key,
      cast(post_time as time) as time_key,
      floor_no,
      post_type,
      is_op_author,
      like_count,
      content_text
    from source
    where topic_id is not null
      and user_id is not null

)

select *
from final