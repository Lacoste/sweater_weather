class LocationService

  def initialize(location)
    @location = location
  end

  def lat
    long_lat[:lat].truncate(4)
  end

  def long
    long_lat[:lng].truncate(4)
  end

  def long_lat
    results = get_json[:results][0]
    results[:geometry][:location]
  end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params['key']=ENV['GOOGLE_API_KEY']
      f.params['address']=@location
      f.adapter Faraday.default_adapter
    end
  end
end
