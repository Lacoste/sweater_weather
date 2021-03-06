class PhotoService

  def initialize(search_info)
    @city_name = search_info.split(",")[0]
  end

  def api_response  
    get_json(@city_name)
  end

  def city_image
    image_data = get_json(@city_name)
    image_data[:results][0][:urls][:regular]
  end

  private

  def get_json(search_info)
    response = conn.get("?query=#{search_info}")
    output = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.unsplash.com/search/photos") do |f|
      f.params['client_id']=ENV['UNSPLASH_API_KEY']
      f.params['orientation']='portrait'
      f.params['page']=1
      f.adapter Faraday.default_adapter
    end
  end

end
