class WeatherData

  def initialize(search_info)
    @search_info = search_info
  end

  def location
    @_city ||= Cities.find_or_create_city(@search_info)
    @_city.find_or_create_background
    return @_city
  end

  def api_weather_data
    @_data ||= DarkSkyService.new(location.latitude, location.longitude).full_info
  end

  def currently
    api_weather_data[:currently]
  end

  def today
    api_weather_data[:daily][:data][0]
  end

  def hourly
    api_weather_data[:hourly][:data][1..8]
  end

  def daily
   api_weather_data[:daily][:data][1..5]
  end

  def hourly_formatted
    hourly.map do |hour|
      hour_hash = {}
      hour.each do |key, value|
        hour_hash[:time] = hour[:time]
        hour_hash[:hour] = Time.at(hour[:time]).strftime("%l%p")
        hour_hash[:temp] = hour[:temperature].round
      end
      hour_hash
    end
  end

  def rest_of_week_formatted
    daily.map do |day|
      daily_hash = {}
      day.each do |key, value|
        daily_hash[:date] = day[:time]
        daily_hash[:day] = Time.at(day[:time]).strftime("%A")
        daily_hash[:icon] = day[:icon]
        daily_hash[:chance_precip] = "#{(day[:precipProbability] * 100).round}%"
        daily_hash[:precip_type] = day[:precipType]
        daily_hash[:high] = day[:temperatureHigh].round
        daily_hash[:low] = day[:temperatureLow].round
      end
      daily_hash
    end
  end

end
