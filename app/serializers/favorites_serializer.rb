class FavoritesSerializer

  def initialize(favorites)
    @favorites = favorites.formatted_weather_data
  end

  def to_hash
    @favorites.map do |fav|
      fav_hash = {}
      fav_hash[:location] = "#{fav[0][:name]}, #{fav[0][:state_abrev]}"
      fav_hash[:current_weather] = currently_hash(fav[0], fav[1], fav[2])
      fav_hash
    end
  end

  def currently_hash(location, current_data, today)
    {
      icon: current_data[:icon],
      conditions: current_data[:summary],
      temp: current_data[:temperature].round,
      high: today[:temperatureHigh].round,
      low: today[:temperatureLow].round,
      city_state: "#{location.name}, #{location.state_abrev}",
      country: location.country,
      search_time: Time.at(current_data[:time]).strftime("%l:%M %p"),
      date: Time.at(current_data[:time]).strftime("%m/%d"),
      latitude: location.latitude,
      longitude: location.longitude
    }
  end

end
