class AntipodLocationService

  def initialize(search_loc_lat, search_loc_long)
    @latitude = search_loc_lat
    @longitude = search_loc_long
  end

  def full_info
    get_json
  end

  private

  def get_json
    binding.pry
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  # http://amypode.herokuapp.com/api/v1/antipodes?lat=22.3193&long=114.1693
  def conn
    Faraday.new('http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers['api_key']=ENV['AMYPOD_API_KEY']
      f.params['lat']=@latitude
      f.params['long']=@longitude
      f.adapter Faraday.default_adapter
    end
  end

end
