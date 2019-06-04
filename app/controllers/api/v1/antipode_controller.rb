class Api::V1::AntipodeController < ApplicationController

  def index
    antipode_data = AntipodeData.new(search_location)
    render json: AntipodeWeatherSerializer.new(antipode_data).to_hash
  end

  private

  def search_location
    params.permit(:loc)
  end

end
