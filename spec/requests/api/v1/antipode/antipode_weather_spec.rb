require 'rails_helper'

describe 'GET /api/v1/antipode' do
  it 'returns weather information for the antipode of a search location' do

    get "/api/v1/antipode?loc=hongkong"

    antipode_info = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    expect(antipode_info.class).to eq(Hash)
    expect(antipode_info[:data].present?).to eq(true)

    data_keys = :id, :type, :attributes

    expect(antipode_info[:data].present?).to eq(true)
    expect(antipode_info[:data].keys).to eq(data_keys)
  end
end
