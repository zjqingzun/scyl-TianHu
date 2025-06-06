# request/module/countrymap/core.py
import plotly.express as px




def plotCountryMap(_data, _title: str = "Country Map", _color: str = "value", _width: int = 800, _height: int = 600):
    """
    Plots a country map using Plotly Express.

    :param _data: DataFrame containing country data with 'country' and 'value' columns.
    :param _title: Title of the plot.
    :param _color: Column name for color scale.
    :param _width: Width of the plot.
    :param _height: Height of the plot.
    :return: Plotly figure object.
    """
    fig = px.choropleth(
        _data,
        locations="country",
        locationmode="country names",
        color=_color,
        title=f'Country Map Highlighting {_title}',
        width=_width,
        height=_height
    )
    
    fig.update_geos(fitbounds="locations", visible=False)
    fig.update_layout(title_x=0.5)
    
    return fig