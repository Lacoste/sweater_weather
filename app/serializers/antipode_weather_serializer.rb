class AntipodeWeatherSerializer

  def initialize(weather_data, search_loc)
    @weather_data = weather_data.api_weather_data[:currently]
    @search_loc = search_loc
    # binding.pry
  end

def to_hash
  {
    data:
        {
            id: "1",
            type: "antipode",
            attributes: {
                location_name: "Antipode City Name",
                forecast: {
                    summary: @weather_data[:summary],
                    current_temperature: @weather_data[:temperature].round,
                				},
            search_location: "Hong Kong"
            }
        }
    }

  end
end
