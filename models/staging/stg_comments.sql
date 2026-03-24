with zhaoxuelu as (

    select
        concat('36317401_', user_id) as comment_id,
        36317401 as drama_id,
        cast(user_id as varchar) as user_id,
        cast(user_name as varchar) as user_name,
        cast(rating as integer) as rating,
        user_comment as comment,
        votes as like_count,
        cast(create_time as timestamp) as comment_time,
        cast(user_location as varchar) as ip_location,
        cast(insert_time as timestamp) as insert_time,
        cast('zhaoxuelu_comments' as varchar) as source_name
    from {{ source('raw', 'zhaoxuelu_comments') }}

),

shujuanyimeng as (

    select
        concat('36744438_', user_id) as comment_id,
        36744438 as drama_id,
        cast(user_id as varchar) as user_id,
        cast(user_name as varchar) as user_name,
        cast(rating as integer) as rating,
        user_comment as comment,
        votes as like_count,
        cast(create_time as timestamp) as comment_time,
        cast(user_location as varchar) as ip_location,
        cast(insert_time as timestamp) as insert_time,
        cast('shujuanyimeng_comments' as varchar) as source_name
    from {{ source('raw', 'shujuanyimeng_comments') }}

),

lizhi as (

    select
        concat('35651341_', user_id) as comment_id,
        35651341 as drama_id,
        cast(user_id as varchar) as user_id,
        cast(user_name as varchar) as user_name,
        cast(rating as integer) as rating,
        user_comment as comment,
        votes as like_count,
        cast(create_time as timestamp) as comment_time,
        cast(user_location as varchar) as ip_location,
        cast(insert_time as timestamp) as insert_time,
        cast('lizhi_comments' as varchar) as source_name
    from {{ source('raw', 'lizhi_comments') }}

),

filter_drama as (

    select
        concat('36553916_', user_id) as comment_id,
        36553916 as drama_id,
        cast(user_id as varchar) as user_id,
        cast(user_name as varchar) as user_name,
        cast(rating as integer) as rating,
        user_comment as comment,
        votes as like_count,
        cast(create_time as timestamp) as comment_time,
        cast(user_location as varchar) as ip_location,
        cast(insert_time as timestamp) as insert_time,
        cast('filter_comments' as varchar) as source_name
    from {{ source('raw', 'filter_comments') }}

)

select * from zhaoxuelu
union all
select * from shujuanyimeng
union all
select * from lizhi
union all
select * from filter_drama

