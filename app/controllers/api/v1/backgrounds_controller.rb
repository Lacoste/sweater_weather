class Api::V1::BackgroundsController < ApplicationController

  def show
    background_data = Backgrounds.new(params[:location]).list
    render json: BackgroundsSerializer.new(background_data).to_hash
  end

  private

end
