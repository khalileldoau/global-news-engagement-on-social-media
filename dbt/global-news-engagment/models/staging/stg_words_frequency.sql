with 

source as (

    select * from {{ source('staging', 'words_frequency') }}

),

renamed as (

    select
     {{ dbt_utils.generate_surrogate_key(['words']) }} as word_id,
        words,
        frequency

    from source

)

select * from renamed


-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}
