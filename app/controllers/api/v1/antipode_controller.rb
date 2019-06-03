class Api::V1::AntipodeController < ApplicationController

  def index
    weather_data =  WeatherData.new(antipode_name)
    render json: AntipodWeatherSerializer.new(weather_data)
  end

  private

  def antipode_name
    search_loc = LocationService.new(params[:loc])

    anti_loc = AntipodLocationService.new("#{search_loc.lat}","#{search_loc.long}")
    anti_lnglat = anti_loc.full_info[:data][:attributes]

    # {:data=>{:id=>"1", :type=>"antipode", :attributes=>{:lat=>-22.3193, :long=>-65.8307}}}
    anti_name = LocationService.new("#{anti_lnglat[:lat]},#{anti_lnglat[:long]}").anti_name
  end

end
