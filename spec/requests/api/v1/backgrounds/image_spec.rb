require 'rails_helper'

describe 'GET /api/v1/backgrounds' do
  it 'returns a background image for a location' do

    get '/api/v1/backgrounds?location=denver,co'

    backgrounds = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)

    expect(backgrounds.class).to eq(Hash)
    expect(backgrounds[:data].class).to eq(Array)
    expect(backgrounds[:data].count <= 10).to eq(true)

    expected_keys = :unsplash_id, :description, :urls
    expect(backgrounds[:data].first.keys).to eq(expected_keys)
  end
end
