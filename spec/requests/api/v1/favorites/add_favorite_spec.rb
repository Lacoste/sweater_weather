require 'rails_helper'

describe 'POST /api/v1/favorites' do
  context 'with a valid api_key' do
    it 'adds a favorite for the user, and returns a 201 status code' do
      user = create(:user, api_key: "abc123")
      expect(user.favorites.count).to eq(0)

      post_body = {
        "location": "Denver, CO",
        "api_key": "abc123"
        }

      post '/api/v1/favorites', params: post_body

      favorite_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(favorite_response[:outcome]).to eq("Successfully Added")
      expect(user.favorites.count).to eq(1)
    end
  end

  context 'with an invalid api_key' do
    it 'no favorites are added, and a 401 status code is returned' do
      user = create(:user, api_key: "abc123")
      expect(user.favorites.count).to eq(0)

      post_body = {
        "location": "Denver, CO",
        "api_key": "xyz123"
        }

      post '/api/v1/favorites', params: post_body

      favorite_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(favorite_response[:invalid]).to eq("Unauthorized")
      expect(user.favorites.count).to eq(0)
    end
  end
end
