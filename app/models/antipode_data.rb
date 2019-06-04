class AntipodeData

  def initialize(search_location)
    @search_location = search_location
  end

  def city
    city = Cities.find_or_create_city(antipode_name)
  end

  def search_city
    search_loc.search_name
  end

  def weather
    WeatherData.new(city.name).currently
  end

  private

  def antipode_name
    anti_name = LocationService.new("#{anti_lnglat[:lat]},#{anti_lnglat[:long]}").anti_name
  end

  def anti_lnglat
    anti_lnglat = anti_loc.full_info[:data][:attributes]
  end

  def anti_loc
    anti_loc = AntipodeLocationService.new("#{search_loc.lat}","#{search_loc.long}")
  end

  def search_loc
    search_loc = LocationService.new(@search_location)
  end

end
