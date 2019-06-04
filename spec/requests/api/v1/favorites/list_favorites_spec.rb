require 'rails_helper'

describe 'GET /api/v1/favorites' do
  context 'with a valid api key' do
    it 'returns a list of favorite locations and current weather info' do
      user = create(:user, api_key: "abc123")

      denver = Cities.find_or_create_city("denver,co")
      golden = Cities.find_or_create_city("golden,co")

      user.favorites.create(cities_id: denver.id)
      user.favorites.create(cities_id: golden.id)

      get_body = {
        "api_key": "abc123"
      }

      get '/api/v1/favorites', params: get_body

      favorites_response = JSON.parse(response.body, symbolize_names: true)

      first_fav = favorites_response.first

      expect(response.status).to eq(200)
      expect(favorites_response.count).to eq(2)

      expect(first_fav[:location]).to eq("Denver, CO")
      expect(first_fav[:current_weather].present?).to eq(true)
    end
  end

  context 'with an invalid api key' do
    it 'no favorites are shown, and a 401 status code is returned' do
      user = create(:user, api_key: "abc123")

      denver = Cities.find_or_create_city("denver,co")
      golden = Cities.find_or_create_city("golden,co")

      user.favorites.create(cities_id: denver.id)
      user.favorites.create(cities_id: golden.id)

      get_body = {
        "api_key": "xyz123"
      }

      get '/api/v1/favorites', params: get_body

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(error_response[:invalid]).to eq("Unauthorized")
    end
  end
end
