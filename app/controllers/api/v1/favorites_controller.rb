class Api::V1::FavoritesController < ActionController::API

  def create
    if user = User.find_by(api_key: favorite_params[:api_key])
      city = Cities.find_or_create_city(search_location)
      Favorite.create(user_id: user.id, cities_id: city.id, name: city.name)
      render status: 201, json: { outcome: "Successfully Added" }
    else
      render status: 401, json: { invalid: "Unauthorized" }
    end
  end

  private

  def search_location
    search = favorite_params[:location]
    formatted = search.downcase.delete(" ")
  end

  def favorite_params
    params.permit(:location, :api_key)
  end

end
