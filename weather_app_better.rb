require 'wunderground'

def get_location(user_location)
	puts "Let's show you the weather! What city/state or zip code should we look at?"
	user_location = gets
end

user_location = get_location(user_location)

def get_forecast(user_location)
	w_api = Wunderground.new("6d65d1572530e62a")
	forecast_conditions = w_api.forecast_for(user_location).fetch('forecast').fetch('simpleforecast').fetch('forecastday').first.fetch('conditions')
	puts forecast_conditions
end

forecast_conditions = get_forecast(user_location)