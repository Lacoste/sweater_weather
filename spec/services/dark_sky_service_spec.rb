require 'rails_helper'

describe 'DarkSkyService' do
  describe 'Instance Methods' do

    context '#full_info' do
      it 'returns all weather data' do

        latitude = 39.7392
        longitude = -104.9902

        weather_info = DarkSkyService.new(latitude, longitude).full_info

        expect(weather_info[:currently].present?).to eq(true)
        expect(weather_info[:hourly][:data].count).to eq(49)
        expect(weather_info[:daily][:data].count).to eq(8)
      end
    end
  end
end
