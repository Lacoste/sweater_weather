class LocationService

  def initialize(location)
    @location = location
  end

  def lat
    lat_long[:lat].truncate(4)
  end

  def long
    lat_long[:lng].truncate(4)
  end

  def lat_long
    results = get_city_json[:results][0]
    results[:geometry][:location]
  end

  def details
    info = get_city_json[:results][0]
    info[:address_components]
  end

  def anti_name
    info = get_antipod_json
    info[:results][1][:address_components][0][:long_name]
  end

  def search_name
    info = get_city_json
    info[:results][0][:address_components][0][:long_name]
  end

  private

  def get_antipod_json
    response = conn.get("?latlng=#{@location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_city_json
    response = conn.get("?address=#{@location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params['key']=ENV['GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

end
