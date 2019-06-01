require 'rails_helper'

describe 'LocationService', type: :service do
  describe 'Instance Methods' do

    context '#long_lat' do
      it 'returns original API data in the form of a hash' do

        location = "denver,co"
        long_lat = LocationService.new(location).long_lat

        expect(long_lat.class).to eq(Hash)
        expect(long_lat[:lat]).to eq(39.7392358)
        expect(long_lat[:lng]).to eq(-104.990251)
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
