select
    cast(drama_id as int) as drama_id,
    cast(drama_name as varchar) as drama_name,
    release_year,
    director,
    actors,
    release_date,
    rating,
    rating_people,
    rating_1_star,
    rating_2_star,
    rating_3_star, 
    rating_4_star,
    rating_5_star,
    total_comments,
    total_reviews,
    total_discussions,
    cast(insert_time as timestamp) as insert_time
from {{ source('raw', 'douban_drama_info') }}
where drama_id is not null