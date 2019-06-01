require 'rails_helper'

describe 'LocationService', type: :service do
  describe 'API call' do
    it 'should successfully gather information from an API call' do

      location = "denver,co"
      response = LocationService.new(location)

      parsed = JSON.parse(response.body, symbolize_name: true)

      expect(parsed[:status]).to eq("OK")
      # expect(parsed[:results])
    end
  end
end
