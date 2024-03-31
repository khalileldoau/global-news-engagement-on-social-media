{{ config(materialized="table") }}

select word_id, words as word, frequency
from {{ ref("stg_words_frequency") }}
where length(words) >= 2
--where words = 'the'
