{{ config(materialized="table") }}

select distinct 
    word_id,
    words as word
from {{ ref("stg_words_frequency") }}
where length(words) > 2