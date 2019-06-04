Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#show'

      get '/favorites', to: 'favorites#index'
      post '/favorites', to: 'favorites#create'

      get '/forecast', to: 'forecast#show'

      post '/sessions', to: 'sessions#create'

      post '/users', to: 'users#create'
    end
  end

end
