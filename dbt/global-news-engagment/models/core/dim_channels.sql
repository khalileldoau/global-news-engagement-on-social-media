{{ config(materialized='table') }}

select distinct 
    channel_id, 
    channel
from {{ ref('stg_news_dataset') }}