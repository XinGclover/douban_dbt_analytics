with base_comments as (

    select * 
    from {{ ref('stg_comments') }}

),

drama_collection as (

    select * 
    from {{ ref('stg_drama_collection') }}

),

unioned as (

    select * from base_comments
    union all
    select * from drama_collection

)

select
    concat(source_name, '_', comment_id) as comment_key,
    *
from unioned