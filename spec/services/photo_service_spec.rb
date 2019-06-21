require 'rails_helper'

describe 'PhotoService', type: :service do
  describe 'Instance Methods' do
    context 'city_img' do
      it 'returns a URL for a background image based on search location' do

        denver = City.create(
          { search_name: "denver,co",
            latitude: 39.7392,
            longitude: 104.9902,
            name:"Denver",
            state_abrev: "CO",
            country: "United States",
            background_img: nil }
        )

        city_name = denver.name

        image = PhotoService.new(city_name).city_image

        expect(image.class).to eq(String)
        expect(image).to include("https://images.unsplash.com/photo")
      end
    end
  end
end
