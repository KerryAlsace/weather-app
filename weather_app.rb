require 'wunderground'

def get_location(user_location)
	puts "Let's show you the weather! What city/state or zip code should we look at?"
	user_location = gets
end

user_location = get_location(user_location)

def get_forecast(user_location)
	w_api = Wunderground.new("6d65d1572530e62a")
	whole_forecast_hash = w_api.forecast_for(user_location).fetch('forecast')

	simple_forecast_hash = whole_forecast_hash.fetch('simpleforecast')

	forecastday_array = simple_forecast_hash.fetch('forecastday')

	forecast_date = forecastday_array.first
	
	forecast_conditions = forecast_date.fetch('conditions')

	puts forecast_conditions
end

forecast_conditions = get_forecast(user_location)