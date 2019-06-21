class ApiController < ActionController::API

  def user
    user = User.find_by(api_key: favorite_params[:api_key])
    unless user
      render status: 401, json: { invalid: "Unauthorized" }
    else
      user
    end
  end

end
