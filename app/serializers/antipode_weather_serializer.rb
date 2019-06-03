class AntipodeWeatherSerializer

  def initialize(weather_data, search_loc)
    @weather_data = weather_data.api_weather_data
    @search_loc = search_loc
  end

  # def to_hash
  #   {
  #     data: [ {
  #         id: "id",
  #         type: "antipod",
  #         attributes: {
  #           location_name: "location city name",
  #           forecast: {
  #             summary: "cloud?",
  #             current_temperature: "73?"
  #           },
  #         search_location: "hong kong?"
  #       }
  #     ]
  #   }
  # end


def to_hash

  {
    data:
        {
            id: "1",
            type: "antipode",
            attributes: {
                location_name: "Antipode City Name",
                forecast: {
                    summary: "Mostly Cloudy",
                    current_temperature: "72",
                				},
            search_location: "Hong Kong"
            }
        }
    }

  end
end
