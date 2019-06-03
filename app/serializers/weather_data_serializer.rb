class WeatherDataSerializer

  def initialize(weather_data)
    @location = weather_data.location
    @currently = weather_data.currently
    @today = weather_data.today
    @hourly = weather_data.hourly_formatted
    @rest_of_week = weather_data.rest_of_week_formatted
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
          date: Time.at(@currently[:time]).strftime("%m/%d"),
          latitude: @location.latitude,
          longitude: @location.longitude
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
          hourly: @hourly,
          extended: @rest_of_week
        }
      }
    }
  end

end
