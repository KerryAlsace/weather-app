require 'rubygems'
require 'twilio-ruby'
require 'wunderground'

account_sid = "ACd87888923a4f38d40611ee3a0f09c48e"
auth_token = "e6eeb532c0b14ce04c4c3159abaeb285"

@client = Twilio::REST::Client.new(account_sid, auth_token)

user_location = '11237'

def get_forecast(user_location)
	w_api = Wunderground.new("6d65d1572530e62a")
	forecast_conditions = w_api.forecast_for(user_location).fetch('forecast').fetch('simpleforecast').fetch('forecastday').first.fetch('conditions')
end

forecast_conditions = get_forecast(user_location)

message = @client.messages.create(
from: "6465767817",
to: "9178375484",
body: get_forecast(user_location) 
)

puts message.to

