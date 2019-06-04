require 'rails_helper'

describe 'POST /api/v1/users' do
  context 'with valid information' do
    it 'creates an account for a user, and provides an api_key in the response' do
      post_body =  {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
        }

      post '/api/v1/users', params: post_body

      creation_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(creation_response[:api_key].present?).to eq(true)
    end
  end

  context 'with invalid information' do
    it 'returns an error message and a 400 code' do
      user = create(:user, email: "whatever@example.com")

      post_body =  {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "non-matching-pw"
        }

      post '/api/v1/users', params: post_body

      error_response = JSON.parse(response.body, symbolize_names: true)
      error_message = "Email has already been taken, Password confirmation doesn't match Password"

      expect(response.status).to eq(400)
      expect(error_response[:invalid]).to eq(error_message)
    end
  end
end
