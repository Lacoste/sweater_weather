class Api::V1::AntipodeController < ApplicationController

  def index
    # params "loc"=>"hongkong"
    render json: WeatherData.new(antipode_loc)
  end

  private

  def antipode_loc
    binding.pry
    # anti_loc = find antipode lat long (AmiPodService)

    # anti_name = find antipode city name (AntipodeNameService) - will return name

    # WeatherData.new(anti_name) - will create a city object

    # connect to anipode API to get updated location
  end

end
