class Api::V1::ForecastController < ApplicationController

  def show
    weather_data = WeatherData.new(params[:location])
    render json: WeatherDataSerializer.new(weather_data).to_hash
  end

end
