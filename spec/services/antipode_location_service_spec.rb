require 'rails_helper'

describe 'AntipodeLocationService' do
  describe 'Instance Methods' do

    context '#full_info' do
      it 'returns coordinates for a locations antipode' do

        search_loc_lat = 22.3193
        search_loc_long = 114.1693

        antipode_info = AntipodeLocationService.new(search_loc_lat, search_loc_long).full_info

        expected_keys = :id, :type, :attributes

        expect(antipode_info[:data].keys).to eq(expected_keys)
        expect(antipode_info[:data][:type]).to eq("antipode")

        expect(antipode_info[:data][:attributes][:lat]).to eq(-22.3193)
        expect(antipode_info[:data][:attributes][:long]).to eq(-65.8307)
      end
    end
  end
end
