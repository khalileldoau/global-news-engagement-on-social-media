# global-news-engagement-on-social-media

### Objective
The objective of this porject is to build a dashboard that shows the engagement of people with news shared by major news channel, on social media. Using the dashboard, you can search for news containing specific keywords, read the top posts by engagment for the searched keyword, see the most frequent words used while reporting on the searched keyword, see how many posts are made by each channel using the serchead keyword, and the engagement with each channel. 

Dahsboard link: https://lookerstudio.google.com/s/l4pav5Xapvs

### The dataset

For this exercise, I used Kaggle dataset called "Global News Engagement on Social Media" (https://www.kaggle.com/datasets/kanchana1990/global-news-engagement-on-social-media).

As stated in the dataset about section: "This comprehensive dataset offers a deep dive into the social media engagement metrics of nearly 4,000 posts from four of the world's leading news channels: CNN, BBC, Al Jazeera, and Reuters. Curated to provide a holistic view of global news interaction on social media, the collection stands out for its meticulous assembly and broad spectrum of content."

For more details about the dataset, please to the link shared above.

For the sake of this project, and for ease of access to this data without using the Kaggle API, I loaded this data to my GitHub repo under "datasets" folder (https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/datasets).


### Data exploration

I started the porject with a small data exploration exercise locally in Jupyter Notebook: https://github.com/khalileldoau/global-news-engagement-on-social-media/blob/main/datasets-exploration/data-exploration.ipynb

After I decided on how my dashboard would look like, what data transformations to do, and what technologies to use, I started developping my pipelines.

### Mage-Terraform

I started developing and testing the pipleines I needed in Mage locally. I develloped two pipelines (Batch pipelines):
- load_to_gcs pipeline: https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/mage/load_to_gcs

  I used this pipline to, first, load the original datsets, named "news_dataset" after concatenation, to GCS, and, second, create a new dataset, named "words_frequency", then load it to GCS as well.

  I created the words_frquency dataset from the corpus of all text in the datasets, after filtiring out stopwords and punction and doing lammenization using NLTK datasets.


- gcs_to_bq pipeline: https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/mage/gcs_to_bq

  I used this pipeline to read both datasets: "news_dataset" and "words_frequency" from GCS to BQ.

After checking the pipelines are running properly, I deployed the pipelines in GCP using Terraform: https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/terraform
I shceduled the piplines to run daily.


### dbt

After I scheduled the piplines to load the data daily to BQ, I started doing further modeling of the data warehouse using dbt cloud: https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/dbt

I scheduled the job to run daily in production with dbt cloud. Production data is living in "prod" dataset in BigQuery

The core tables are:
- dim_words
- dim_channels
- fct_posts

![image](https://github.com/khalileldoau/global-news-engagement-on-social-media/assets/79168986/b3e9fbc9-f57c-43b9-9f88-25ba44ed50fa)





### Looker

Finally, I vizualized the data with looker, using the data from the fct_posts tables from the production dataset in BigQuery.

Dahsboard link: https://lookerstudio.google.com/s/l4pav5Xapvs

As I said earlier, the dashboard can be used to search for news containing specific keywords, see the top posts by engagment, how many posts are made by each channel on a sepcific topic, filter news by specific channel, and see to the most frequent words used when filtering by a specific topic.









  

  

  





