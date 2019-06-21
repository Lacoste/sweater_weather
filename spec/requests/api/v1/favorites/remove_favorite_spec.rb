require 'rails_helper'

describe 'DELETE /api/v1/favorites' do
  context 'with a valid api key' do
    it 'removes a city from the list of favorites' do
      user = create(:user, api_key: "abc123")

      denver = City.find_or_create_city("denver,co")
      golden = City.find_or_create_city("golden,co")

      user.favorites.create(city_id: denver.id)
      user.favorites.create(city_id: golden.id)

      expect(user.favorites.count).to eq(2)

      delete_body = {
        "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
        "api_key": "abc123"
      }

      delete '/api/v1/favorites', params: delete_body

      delete_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(delete_response.count).to eq(1)
      expect(delete_response[0][:location]).to eq("Golden, CO")

      expect(user.favorites.count).to eq(1)
    end
  end

  context 'with an invalid api key' do
    it 'does not remove a city from the favorites, and a 401 code is returned' do
      user = create(:user, api_key: "abc123")

      denver = City.find_or_create_city("denver,co")
      golden = City.find_or_create_city("golden,co")

      user.favorites.create(city_id: denver.id)
      user.favorites.create(city_id: golden.id)

      expect(user.favorites.count).to eq(2)

      delete_body = {
        "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
        "api_key": "xyz123"
      }

      delete '/api/v1/favorites', params: delete_body

      delete_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(delete_response[:invalid]).to eq("Unauthorized")

      expect(user.favorites.count).to eq(2)
    end
  end
end
