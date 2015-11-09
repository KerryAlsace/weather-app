require 'wunderground'

def get_location(user_location)
	puts "Let's show you the weather! What city/state or zip code should we look at?"
	user_location = gets
end

user_location = get_location(user_location)

def get_forecast(user_location)
	w_api = Wunderground.new("6d65d1572530e62a")
	forecast_conditions = w_api.forecast_for(user_location).fetch('forecast').fetch('simpleforecast').fetch('forecastday')
end

forecast_conditions = get_forecast(user_location)

day_one = {"day"=>"Today", "weather"=>forecast_conditions[0].fetch('conditions')}
day_two = {"day"=>"Tomorrow", "weather"=>forecast_conditions[1].fetch('conditions')}
day_three = {"day"=>forecast_conditions[2].fetch('date').fetch('weekday'), "weather"=>forecast_conditions[2].fetch('conditions')}
day_four = {"day"=>forecast_conditions[3].fetch('date').fetch('weekday'), "weather"=>forecast_conditions[3].fetch('conditions')}

puts "#{day_one.values[0]}'s weather is #{day_one.values[1].downcase}"
puts "#{day_two.values[0]}'s weather is #{day_two.values[1].downcase}"
puts "#{day_three.values[0]}'s weather is #{day_three.values[1].downcase}"
puts "#{day_four.values[0]}'s weather is #{day_four.values[1].downcase}"
