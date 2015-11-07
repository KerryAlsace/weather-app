require 'wunderground'

def get_location(user_location)
	puts "Let's show you the weather! What city/state or zip code should we look at?"
	user_location = gets
end

user_location = get_location(user_location)

def get_forecast(user_location)
	w_api = Wunderground.new("6d65d1572530e62a")
	whole_forecast = w_api.forecast_for(user_location)
	forecast_array = whole_forecast.fetch('simpleforecast')
	today_forecast_array = forecast_array.fetch({"period"=>1})
	forecast_summary = today_forecast_array.values(conditions)
	puts forecast_summary
end

forecast_summary = get_forecast(user_location)

