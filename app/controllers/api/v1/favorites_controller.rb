class Api::V1::FavoritesController < ActionController::API
  before_action :user

    def create
      city = Cities.find_or_create_city(search_location)
      Favorite.create(user_id: user.id, cities_id: city.id, name: city.name)
      render status: 201, json: { outcome: "Successfully Added" }
    end

    def index
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

    def user
      user = User.find_by(api_key: favorite_params[:api_key])
      unless user
        render status: 401, json: { invalid: "Unauthorized" }
      else
        user
      end
    end

end
