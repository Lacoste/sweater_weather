class Cities < ApplicationRecord
  validates_presence_of :search_name,
                        :latitude,
                        :longitude,
                        :name,
                        :state_abrev,
                        :country
  has_many :favorites

  def self.find_or_create_city(location)
    if Cities.find_by(search_name: location)
      return Cities.find_by(search_name: location)
    else
      city_info = LocationService.new(location)
      Cities.create(search_name: location,
                    latitude: city_info.lat,
                    longitude: city_info.long,
                    name: city_info.details[0][:short_name],
                    state_abrev: city_info.details[2][:short_name],
                    country: city_info.details[3][:long_name])
    end
  end

  def find_or_create_background
    unless self.background_img.present?
      background = PhotoService.new(self.search_name)
      self.background_img = background.city_image
    end
  end

  def location
    "#{name}, #{state_abrev}"
  end

  def weather_data
    WeatherData.new(search_name)
  end

end
