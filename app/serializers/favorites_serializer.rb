class FavoritesSerializer

  def initialize(favorites)
    @favorites = favorites
  end

  def to_hash
    @favorites.map do |favorite|
      {
        location: favorite.cities.location,
        current_weather: current_weather(favorite.cities)
      }
    end
  end

  def current_weather(city)
    weather_data = city.weather_data

    {
      icon: weather_data.currently[:icon],
      conditions: weather_data.currently[:summary],
      temp: weather_data.currently[:temperature].round,
      high: weather_data.today[:temperatureHigh].round,
      low: weather_data.today[:temperatureLow].round,
      city_state: city.location,
      country: city.country,
      search_time: Time.at(weather_data.currently[:time]).strftime("%l:%M %p"),
      date: Time.at(weather_data.currently[:time]).strftime("%m/%d"),
      latitude: city.latitude,
      longitude: city.longitude
    }
  end


end
