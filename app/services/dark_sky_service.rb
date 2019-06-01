class DarkSkyService

  def initialize(latitude, longitude)
    @lat = latitude
    @long = longitude
  end

  def full_info
    get_json
  end

# potential additional sorting methods
  # def current_overview
  # end
  #
  # def current_details
  # end
  #
  # def forecast
  # end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@long}") do |f|
      f.params['exclude']= "minutely,alerts,flags"
      f.adapter Faraday.default_adapter
    end
  end

end
