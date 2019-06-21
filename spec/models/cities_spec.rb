require 'rails_helper'

describe City, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :search_name }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :name }
    it { should validate_presence_of :state_abrev }
    it { should validate_presence_of :country }
  end

  describe 'Relationships' do
    it {should have_many :favorites }
  end

  describe 'Class Methods' do
    context '::find_or_create_city()' do
      it 'finds or creates a new city based on search input info' do
        search_name = "denver,co"

        expect(City.count).to eq(0)

        City.find_or_create_city(search_name)

        expect(City.count).to eq(1)
        expect(City.first.name).to eq("Denver")
        expect(City.first.state_abrev).to eq("CO")

        City.find_or_create_city(search_name)
        #finds existing city - no new city is added to table
        expect(City.count).to eq(1)
      end
    end
  end

  describe 'Instance Methods' do
    context '#find_or_create_background' do
      it 'finds a background_img for a city if it does not already have one' do
        denver = City.create(
          { search_name: "denver,co",
            latitude: 39.7392,
            longitude: 104.9902,
            name:"Denver",
            state_abrev: "CO",
            country: "United States",
            background_img: nil }
        )

        expect(denver.background_img).to eq(nil)

        new_image = denver.find_or_create_background

        expect(denver.background_img).to eq(new_image)
        expect(denver.background_img.class).to eq(String)
      end

      it 'does not creates a background_img for a city which already has one' do
        denver = City.create(
          { search_name: "denver,co",
            latitude: 39.7392,
            longitude: 104.9902,
            name:"Denver",
            state_abrev: "CO",
            country: "United States",
            background_img: "fake-phot-url" }
        )

        expect(denver.background_img).to eq("fake-phot-url")
        expect(denver.background_img.present?).to eq(true)

        denver.find_or_create_background

        expect(denver.background_img).to eq("fake-phot-url")
      end
    end
  end
end
