require 'rails_helper'

describe 'POST /api/v1/sessions' do
  context 'with valid information' do
    it 'logs a user in if they have an account' do
      user = create(:user,
                    email: "whatever@example.com",
                    password: "password",
                    api_key: "abc123"
                    )

      post_body = {
        "email": "whatever@example.com",
        "password": "password"
        }

      post '/api/v1/sessions', params: post_body

      session_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(session_response[:api_key]).to eq("abc123")
    end
  end

  context 'with invalid credentials' do
    it 'returns an invalid credentials message with a 400 status code' do
      user = create(:user,
                    email: "whatever@example.com",
                    password: "password",
                    api_key: "abc123"
                    )

      post_body = {
        "email": "whatever@example.com",
        "password": "wrong-password"
        }

      post '/api/v1/sessions', params: post_body

      session_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(session_response[:invalid]).to eq("Invalid Credentials")
    end
  end
end
