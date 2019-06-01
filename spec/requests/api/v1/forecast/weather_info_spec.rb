require 'rails_helper'

describe 'GET /api/v1/forecast' do
  it 'returns current and future weather information' do

    get '/api/v1/forecast?location=denver,co'

    weather_info = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(weather_info.class).to eq(Hash)

    expect(weather_info[:data][:current][:city_state]).to eq("Denver, CO")
    expect(weather_info[:data][:details].present?).to eq(true)
    expect(weather_info[:data][:forecast][:hourly].count).to eq(8)
    expect(weather_info[:data][:forecast][:extended].count).to eq(5)
  end
end
