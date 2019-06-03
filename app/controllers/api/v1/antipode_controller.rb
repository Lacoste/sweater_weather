class Api::V1::AntipodeController < ApplicationController

  def index
    weather_data =  WeatherData.new(antipode_name)
    render json: AntipodeWeatherSerializer.new(weather_data, search_loc).to_hash
  end

  private

  def antipode_name
    anti_name = LocationService.new("#{anti_lnglat[:lat]},#{anti_lnglat[:long]}").anti_name
  end

  def search_loc
    search_loc = LocationService.new(params[:loc])
    binding.pry
  end

  def anti_loc
    anti_loc = AntipodLocationService.new("#{search_loc.lat}","#{search_loc.long}")
  end

  def anti_lnglat
    anti_lnglat = anti_loc.full_info[:data][:attributes]
  end

  def antipod_search_info
    # create an object..
  end

end
