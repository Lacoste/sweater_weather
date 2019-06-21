class Api::V1::FavoritesController < ApiController
  before_action :user

  def create
    city = City.find_or_create_city(search_location)
    Favorite.create(user_id: user.id, city_id: city.id, name: city.name)
    render status: 201, json: { outcome: "Successfully Added" }
  end

  def index
    render json: FavoritesSerializer.new(user.favorites).to_hash
  end

  def destroy
    to_remove = user.favorites.find_by(city_id: favorite_to_remove.id)
    to_remove.destroy
    render json: FavoritesSerializer.new(user.favorites).to_hash
  end

  private

  def search_location
    search = favorite_params[:location]
    formatted = search.downcase.delete(" ")
  end

  def favorite_params
    params.permit(:location, :api_key)
  end

  def favorite_to_remove
    split = destroy_params[:location].split(",")
    city_input = split[0]
    state_input = split[1].delete(" ")
    city = City.find_by(name: city_input, state_abrev: state_input)
  end

  def destroy_params
    params.permit(:location, :api_key)
  end
end
