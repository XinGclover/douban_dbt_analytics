select
    drama_id,
    drama_name,
    release_year,
    director,
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
    total_discussions
from {{ ref('stg_drama_info') }}