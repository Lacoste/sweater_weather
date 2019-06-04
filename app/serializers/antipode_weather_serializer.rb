class AntipodeWeatherSerializer

  def initialize(antipode_data)
    @antipode = antipode_data.city
    @weather_data = antipode_data.weather
    @search_city = antipode_data.search_city
  end

  def to_hash
    {
      data:
          {
              id: @antipode.id,
              type: "antipode",
              attributes: {
                  location_name: @antipode.name,
                  forecast: {
                      summary: @weather_data[:summary],
                      current_temperature: @weather_data[:temperature].round,
                  				},
                  search_location: @search_city
              }
          }
      }
  end

end
