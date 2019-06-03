class Api::V1::AntipodeController < ApplicationController

  def index
    # params "loc"=>"hongkong"
    render json: WeatherData.new(antipode_loc)
  end

  private

  def antipode_loc
    # connect to anipode API to get updated location
  end

end
