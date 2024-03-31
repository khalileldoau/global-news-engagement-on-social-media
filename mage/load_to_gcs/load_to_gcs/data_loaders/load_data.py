import pandas as pd
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):
    """
    Template code for loading data from any source.

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your data loading logic here
    df_aljazeera = pd.read_csv('https://raw.githubusercontent.com/khalileldoau/global-news-engagement-on-social-media/main/datasets/al_jazeera.csv')
    df_aljazeera['channel'] = 'aljazeera'

    df_bbc = pd.read_csv('https://raw.githubusercontent.com/khalileldoau/global-news-engagement-on-social-media/main/datasets/bbc.csv')
    df_bbc['channel'] = 'bbc'

    df_cnn = pd.read_csv('https://raw.githubusercontent.com/khalileldoau/global-news-engagement-on-social-media/main/datasets/cnn.csv')
    df_cnn['channel'] = 'cnn'

    df_reuters = pd.read_csv('https://raw.githubusercontent.com/khalileldoau/global-news-engagement-on-social-media/main/datasets/reuters.csv')
    df_reuters['channel'] = 'reuters'

    df_list = [df_aljazeera, df_bbc, df_cnn, df_reuters]

    df = pd.concat(df_list, axis=0, ignore_index=True)

    return df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
