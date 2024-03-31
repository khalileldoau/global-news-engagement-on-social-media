{{
    config(
        materialized='table'
    )
}}

with words_array as (
    select *, split(text, ' ') as words
    from {{ ref('stg_news_dataset') }})

,words as (
    select * 
    from words_array, unnest(words) as word
)--,
--filtered_words as (
    select word_id, l.*, frequency
    from words l
    inner join {{ ref('stg_words_frequency') }} r
    on l.word = r.words
--)
