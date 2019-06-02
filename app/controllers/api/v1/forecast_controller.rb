class Api::V1::ForecastController < ApplicationController

  def index
    weather_data = DarkSkyService.new(location.latitude, location.longitude).full_info
    render json: WeatherDataSerializer.new(weather_data, location).to_hash
  end

  private

  def location
    @_city ||= Cities.find_or_create_city(params[:location])
    @_city.find_or_create_background
    return @_city
  end



end
