class Api::V1::ForecastController < ApplicationController

  def index
    weather_data = DarkSkyService.new(location.lat, location.long).full_info
    render json: WeatherDataSerializer.new(weather_data, location.details).to_hash
  end

  private

  def location
    # find or create by?
    LocationService.new(params[:location])
  end

end
