class Cities < ApplicationRecord
  validates_presence_of :search_name,
                        :latitude,
                        :longitude,
                        :name,
                        :state_abrev,
                        :country


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
                    country: city_info.details[3][:short_name])
    end
  end

end
