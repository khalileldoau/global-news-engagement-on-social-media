{{ config(materialized="table") }}

select word_id, words as word
from {{ ref("stg_words_frequency") }}

