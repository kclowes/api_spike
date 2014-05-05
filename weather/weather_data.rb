require 'faraday'
require 'json'

response = Faraday.get 'http://api.openweathermap.org/data/2.5/weather?q=Honolulu,HI,USA'
json_data = response.body

JSON.parse(json_data)["weather"].select do |wthr|
  @current_weather_description = wthr["description"]
end

current_temp_data = JSON.parse(json_data)["main"]["temp"]

p "In Honolulu, the #{@current_weather_description} and the temperature is #{current_temp_data}K"

#Get the 7 day forecast for a city of your choosing.


forecast_response = Faraday.get 'http://api.openweathermap.org/data/2.5/forecast/daily?q=Honolulu&mode=json&units=metric&cnt=7'
forecast_json_data = forecast_response.body

JSON.parse(forecast_json_data)["list"].select do |day|
  @high_temp = day["temp"]["max"]
  @low_temp = day["temp"]["min"]
  p "The highs for the next 7 days are: #{@high_temp}"
  p "The lows for the next 7 days are: #{@low_temp}"
end
