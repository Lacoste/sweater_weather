require 'rails_helper'

describe 'POST /api/v1/favorites' do
  context 'with a valid api_key' do
    it 'adds a favorite for the user, and returns a 201 status code' do
      user = create(:user, api_key: "jgn983hy48thw9begh98h4539h4")
      expect(user.favorites.count).to eq(0)
      # If you decide to store cities in your database you can send an id if you prefer
      post_body = {
        "location": "Denver, CO",
        "api_key": "jgn983hy48thw9begh98h4539h4"
        }

      post '/api/v1/favorites', params: post_body

      favorite_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(favorite_response[:outcome]).to eq("Successfully added")
      expect(user.favorites.count).to eq(1)
    end
  end

  context 'with an invalid api_key' do
    it 'no favorites are added, and a 400 status code is returned' do

    end
  end
end
