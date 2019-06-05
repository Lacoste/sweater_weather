# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favorite.destroy_all
Cities.destroy_all
User.destroy_all

user = User.create(email: 'corey@email.com', password: 'password', password_confirmation: 'password', api_key: 'abc123')

cities = Cities.create(
  { search_name: "denver,co", latitude: 39.7392, longitude: -104.9902, name:"Denver", state_abrev: "CO", country: "United States" }
)
