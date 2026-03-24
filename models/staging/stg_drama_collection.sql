with source_data as (

    select
        concat(cast(drama_id as varchar), '_', cast(user_id as varchar)) as comment_id,
        cast(drama_id as integer) as drama_id,
        cast(user_id as varchar) as user_id,
        cast(null as varchar) as user_name,
        cast(rating as integer) as rating,
        cast(comment as varchar) as comment,
        vote_useful,
        cast(rating_time as timestamp) as comment_time,
        cast(null as varchar) as ip_location,
        cast(insert_time as timestamp) as insert_time,
        cast('drama_collection' as varchar) as source_name
    from {{ source('raw', 'drama_collection') }}

)

select *
from source_data
where user_id is not null