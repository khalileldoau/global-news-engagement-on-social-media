# global-news-engagement-on-social-media

The objective of this porject is to build a dashboard that shows the engagement of people with news shared by major news channel, on social media. Using the dashboard, the user can search for news containing specific keywords and see the top posts by engagment, how many posts are made by each channel on this topic, in addition to the most frequent words used when discussing these topics.

Dahsboard link: https://lookerstudio.google.com/s/l4pav5Xapvs

### The dataset

For this exercise, I used Kaggle dataset called "Global News Engagement on Social Media" (https://www.kaggle.com/datasets/kanchana1990/global-news-engagement-on-social-media).

As stated the dataset about section: "This comprehensive dataset offers a deep dive into the social media engagement metrics of nearly 4,000 posts from four of the world's leading news channels: CNN, BBC, Al Jazeera, and Reuters. Curated to provide a holistic view of global news interaction on social media, the collection stands out for its meticulous assembly and broad spectrum of content."

For more details about the dataset, please to the link shared above.

For the sake of this project, and for ease of access to this data without using the Kaggle API, I loaded this data to my GitHub repo under "datasets" folder (https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/datasets).


### ETL

I started the porject with a small data exploration exercise locally in Jupyter Notebook: https://github.com/khalileldoau/global-news-engagement-on-social-media/blob/main/datasets-exploration/data-exploration.ipynb

After I decided on how my dashboard would look like and what data transformations to do, what technologies to use, I started developping my Batch pipeline.

### Mage-Terraform

I started developing the pipleines I needed in Mage locally. I develloped two pipelines:
- load_to_gcs pipeline: https://github.com/khalileldoau/global-news-engagement-on-social-media/tree/main/mage/load_to_gcs

  I used this pipline to, first, load the original dataset, named "news_dataset", to GCS, and, second, create a new dataset, named "words_frequency", then load it to GCS as well.

  I created the wors_frquency dataset from the corpus of all text in the datasets, after filtiring out stopwords and punction using NLTK datasets. However, the dataset   
  requires more curation which I couldn't prioritize given limited time.

  

  





