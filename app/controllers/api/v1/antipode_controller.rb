class Api::V1::AntipodeController < ApplicationController

  def index
    weather_data =  WeatherData.new(antipode_name)
    render json: AntipodeWeatherSerializer.new(weather_data, search_loc, antipode_name).to_hash
  end

  private

  # This should all be refactored into a singe Antipode PORO which can be passed in
  # Came upon this conclusion too late...
  def antipode_name
    anti_name = LocationService.new("#{anti_lnglat[:lat]},#{anti_lnglat[:long]}").anti_name
  end

  def search_loc
    search_loc = LocationService.new(params[:loc])
  end

  def anti_loc
    anti_loc = AntipodLocationService.new("#{search_loc.lat}","#{search_loc.long}")
  end

  def anti_lnglat
    anti_lnglat = anti_loc.full_info[:data][:attributes]
  end

end
