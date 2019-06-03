class AntipodeWeatherSerializer

  def initialize(weather_data, search_loc, antipode_name)
    @weather_data = weather_data.api_weather_data[:currently]
    @antipode = Cities.find_by(name: antipode_name)
    # @search_city = Cities.find_or_create_city(search_loc)
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
                search_location: "Need Data!"
            }
        }
    }

  end
end
