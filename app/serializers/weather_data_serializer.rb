class WeatherDataSerializer

  def initialize(weather_data, location)
    @location = location
    @currently = weather_data[:currently]
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
          city_state: "#{@location.name}, #{@location.state_abrev}",
          country: @location.country,
          search_time: Time.at(@currently[:time]).strftime("%l:%M %p"),
          date: Time.at(@currently[:time]).strftime("%m/%d")
        },
        details: {
          icon: @currently[:icon],
          conditions: @currently[:summary],
          feels_like: @currently[:apparentTemperature].round,
          humidity: "#{(@currently[:humidity] * 100).round}%",
          visibility: "#{'%.2f' % (@currently[:visibility])} miles",
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
