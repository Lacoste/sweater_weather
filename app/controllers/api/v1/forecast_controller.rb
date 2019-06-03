class Api::V1::ForecastController < ApplicationController

  def index
    weather_data = WeatherData.new(params[:location])
    render json: WeatherDataSerializer.new(weather_data)
  end

end
