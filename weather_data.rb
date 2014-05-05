require 'faraday'
require 'json'

response = Faraday.get 'http://api.openweathermap.org/data/2.5/weather?q=Honolulu,HI,USA'
json_data = response.body

JSON.parse(json_data)["weather"].select do |wthr|
  @weather_description = wthr["description"]
end

temp_data = JSON.parse(json_data)["main"]["temp"]
p "In Honolulu, the #{@weather_description} and the temperature is #{temp_data}K"
