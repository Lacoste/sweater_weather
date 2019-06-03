require 'rails_helper'

describe 'GET /api/v1/antipode' do
  it 'returns weather information for the antipode of a search location' do

    get "/api/v1/antipode?loc=hongkong"

    antipode_info = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)

    expect(antipode_info.class).to eq(Hash)
    expect(antipode_info[:data].present?).to eq(true)

    expected_keys = :id, :type, :attributes, :search_location

    expect(antipode_info[:data].present?).to eq(true)
    expect(antipode_info[:data].keys).to eq(expected_keys)
  end
end
