class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cities

  def self.formatted_weather_data
    all_weather_data.map do |weather_data|
      [weather_data.location, weather_data.currently, weather_data.today]
    end
  end

  def self.all_weather_data
    favorite_cities.map do |city|
      WeatherData.new(city.search_name)
    end
  end

  def self.favorite_cities
    favorites = Favorite.all
    favorites.map do |fav|
      fav.find_city
    end
  end

  def find_city
    Cities.find(self.cities_id)
  end

end
