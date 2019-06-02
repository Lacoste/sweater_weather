class BackgroundsSerializer

  def initialize(background_data)
    @background_data = background_data
  end

  def to_hash
    {
      data: @background_data
    }
  end

end
