with unioned as (

    select * from {{ ref('int_users_union') }}

),

grouped as (

    select
        user_id,
        max(user_name) as user_name,
        max(ip_location) as ip_location,
        min(observed_at) as first_seen_at,
        max(observed_at) as last_seen_at
    from unioned
    where user_id is not null
    group by user_id

)

select * from grouped