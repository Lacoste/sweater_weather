class Api::V1::SessionsController < ActionController::API

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: { api_key: user.api_key}
    else
      render status: 400, json: { invalid: 'Invalid Credentials' }
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
