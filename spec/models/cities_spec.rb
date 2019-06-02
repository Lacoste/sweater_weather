require 'rails_helper'

describe Cities, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :search_name}
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
    it {should validate_presence_of :name}
    it {should validate_presence_of :state_abrev}
    it {should validate_presence_of :country}
  end

  describe 'Class Methods' do
    context '::find_or_create_city()' do
      it 'finds or creates a new city based on search input info' do
        search_name = "denver,co"

        expect(Cities.count).to eq(0)

        Cities.find_or_create_city(search_name)

        expect(Cities.count).to eq(1)
        expect(Cities.first.name).to eq("Denver")
        expect(Cities.first.state_abrev).to eq("CO")

        Cities.find_or_create_city(search_name)
        #finds existing city - no new city is added to table
        expect(Cities.count).to eq(1)
      end
    end
  end
end
