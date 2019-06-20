# Sweater Weather

This is a solo project completed at the Turing School of Software & Design - as the last project of Module 3 (Professional Rails Applications). The goal of this project was to build out a number of API endpoints which would provide the necessary information for creating a mock web page (below). In order to do achieve this, multiple external API's were called, Models and PORO's were created, and custom Serializers were used.

![mock](mock_webpage.png)


The original project link can be found here: https://backend.turing.io/module3/projects/sweater_weather

## Endpoints
*An api key is created and given when a user creates an account. That key is only needed for account specific requests*

Weather for a city:  
  
  **GET**   `https://sweater-weather-3400.herokuapp.com/api/v1/forecast?location=denver,co`

Background images for a city:  
**GET**   `https://sweater-weather-3400.herokuapp.com/api/v1/backgrounds?location=denver,co`

Creating an account:  
**POST**    `https://sweater-weather-3400.herokuapp.com/api/v1/users`
```
Example body:
{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```

Logging in:  
**POST**    `https://sweater-weather-3400.herokuapp.com/api/v1/sessions`  
```
Example body:
{
  "email": "whatever@example.com",
  "password": "password"
}
```
Adding Favorite Locations:  
**POST**    `https://sweater-weather-3400.herokuapp.com/api/v1/favorites`
```
Example body:
{
  "location": "Denver, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Listing Favorite Locations:  
**GET**   `https://sweater-weather-3400.herokuapp.com/api/v1/favorites`
```
Example body:
{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Removing Favorite Locations:  
**DELETE**    `https://sweater-weather-3400.herokuapp.com/api/v1/favorites`
```
Example body:
{
  "location": "Denver, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

## Local Setup
Obtain and define the following API keys in a `config/application.yml` file:
```
  Google Geocoding - ENV['GOOGLE_API_KEY']
  Darksky Weather Data - ENV['DARK_SKY_API_KEY']
  Unsplash Photos - ENV['UNSPLASH_API_KEY']
```
Clone down the repo
```
$ git clone https://github.com/CSheesley/sweater_weather
```
Install the gem packages
```
$ bundle install
```
Set up the database
```
$ rake db:{create,migrate,seed}
```
Run the test suite:
```
$ bundle exec rspec
```

## Versions
Ruby 2.4.1  
Rails 5.2.3

## Future Iterations
- Build out an accompanying front end application in JavaScript.
- Using JavaScript for certain time related keys to use client's time zone.
- Implement low-level caching strategies.
