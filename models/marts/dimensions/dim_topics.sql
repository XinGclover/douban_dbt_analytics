with source as (

    select *
    from {{ ref('stg_group_topics') }}

),

deduped as (

    select
        topic_id,
        topic_title,
        topic_time,
        reply_count,
        group_id,
        group_name,
        key_word,
        insert_time,
        source_name,
        row_number() over (
            partition by topic_id
            order by insert_time desc
        ) as rn
    from source
    where topic_id is not null

)

select
    topic_id,
    topic_title,
    topic_time,
    reply_count,
    group_id,
    group_name,
    key_word,
    insert_time,
    source_name
from deduped
where rn = 1