class WeatherDataSerializer

  def initialize(weather_data, location_details)
    @currently = weather_data[:currently]
    @location_details = location_details
    @today = weather_data[:daily][:data][0]
    @hourly = weather_data[:hourly][:data][1..8]
    @rest_of_week = weather_data[:daily][:data][1..5]
  end

  def to_hash
    {
      data: {
        current: {
          icon: @currently[:icon],
          conditions: @currently[:summary],
          temp: @currently[:temperature].round,
          high: @today[:temperatureHigh].round,
          low: @today[:temperatureLow].round,
          city_state: "#{@location_details[0][:short_name]}, #{@location_details[2][:short_name]}",
          country: @location_details[3][:long_name],
          search_time: Time.at(@currently[:time]).strftime("%l:%M %p"),
          date: Time.at(@currently[:time]).strftime("%m/%d")
        },
        details: {
          icon: @currently[:icon],
          conditions: @currently[:summary],
          feels_like: @currently[:apparentTemperature],
          humidity: @currently[:humidity],
          visibility: @currently[:visibility],
          uv_index: @currently[:uvIndex],
          summary: @today[:summary],
        },
        forecast: {
          hourly: hourly_formatted(@hourly),
          extended: rest_of_week_formatted(@rest_of_week)
        }
      }
    }
  end

  private

  def hourly_formatted(hourly)
    hourly.map do |hour|
      hour_hash = {}
      hour.each do |key, value|
        hour_hash[:hour] = Time.at(hour[:time]).strftime("%l%p")
        hour_hash[:temp] = hour[:temperature].round
      end
      hour_hash
    end
  end

  def rest_of_week_formatted(rest_of_week)
    rest_of_week.map do |day|
      daily_hash = {}
      day.each do |key, value|
        daily_hash[:date] = Time.at(day[:time]).strftime("%A")
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