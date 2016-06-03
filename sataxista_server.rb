require 'sinatra'
require 'json'

def get_request_param
  request.body.rewind  # in case someone already read it
  JSON.parse request.body.read
end

# CONTROLLER
post '/receive_taxi_requests' do
  data = get_request_param

  response = {}

  if data['taxiId'].nil? || data['taxiId'].to_i <= 0
    response['code'] = 1
    response['message'] = 'Invalid param: "taxiId"'
  elsif data['enable'].nil?
    response['code'] = 1
    response['message'] = 'Invalid param: "enable"'
  end

  response.to_json
end

post "/api" do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  "Hello #{data['name']}!"
end
