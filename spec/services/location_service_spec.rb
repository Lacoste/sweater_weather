require 'rails_helper'

describe 'LocationService', type: :service do
  describe 'Instance Methods' do

    context '#lat_long' do
      it 'returns original API data in the form of a hash' do

        location = "denver,co"
        lat_long = LocationService.new(location).lat_long

        expect(lat_long.class).to eq(Hash)
        expect(lat_long[:lat]).to eq(39.7392358)
        expect(lat_long[:lng]).to eq(-104.990251)
      end
    end

    context '#lat' do
      it 'returns a latitude measurement formatted to four decimals' do
        location = "denver,co"
        latitude = LocationService.new(location).lat

        expect(latitude).to eq(39.7392)
      end
    end

    context '#long' do
      it 'returns a longitude measurement formatted to four decimals' do
        location = "denver,co"
        longitude = LocationService.new(location).long

        expect(longitude).to eq(-104.9902)
      end
    end
  end
end
