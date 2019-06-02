class Backgrounds

  def initialize(search_info)
    @search_info = search_info
  end

  def list
    data = PhotoService.new(@search_info).api_response
    data[:results].map do |image|
      image_hash = {}
      image.each do |key, value|
        image_hash[:unsplash_id] = image[:id]
        image_hash[:description] = image[:description]
        image_hash[:urls] = image[:urls]
      end
      image_hash
    end
  end

end
