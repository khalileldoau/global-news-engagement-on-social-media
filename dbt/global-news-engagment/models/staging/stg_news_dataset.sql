{{
    config(
        materialized='view'
    )
}}

with 

source as (

    select * from {{ source('staging', 'news_dataset') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(['text', 'channel']) }} as post_id,
        {{ dbt_utils.generate_surrogate_key(['channel']) }} as channel_id,
        text,
        likes,
        comments,
        shares,
        channel

    from source

)

select * from renamed



-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}