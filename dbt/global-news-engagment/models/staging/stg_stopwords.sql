with 

source as (

    select * from {{ source('staging', 'stopwords') }}

),

renamed as (

    select
        stopword

    from source

)

select * from renamed


-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}
