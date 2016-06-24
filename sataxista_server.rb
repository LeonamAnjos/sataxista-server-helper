require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
# CONTROLLER

get '/say_hi' do
  '<h1>Hi!</h1>'
end

post '/receive_taxi_requests' do
  data = get_request_param

  response = {}

  if data['taxi_id'].nil? || data['taxi_id'].to_i <= 0
    response['code'] = 1
    response['message'] = 'Invalid param: "taxi_id"'
  elsif data['enable'].nil?
    response['code'] = 1
    response['message'] = 'Invalid param: "enable"'
  end

  l(response.to_json)
end

post "/api" do
  data = get_request_param
  "Hello #{data['name']}!"
end

post "/authentication" do
  data = get_request_param

  response = {}

  email = data['email'] || ''
  password = data['password'] || ''

  if email == 'a@b.c' && password == '123456'
    response['token'] = 'TOKEN'
    response['taxi_id'] = 123
  else
    response['code'] = 1
    response['message'] = 'Invalid e-mail/password'
  end

  l(response.to_json)
end

put "/location" do
  data = get_request_param
	response = {}

  token = data['token'] || ''

	if token != 'TOKEN'
			response['code'] = 1
			response['message'] = 'Authentication fail'
  end

  l(response.to_json)
end

post "/accept_request" do
  data = get_request_param

  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

post "/refuse_request" do
  data = get_request_param
 
  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

post "/finish_request" do
  data = get_request_param
 
  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

private

def check_token(data)
  token = data['token'] || ''
  taxi_id = data['taxi_id'] || ''

  if token == 'TOKEN'
    return {}
  end

  {code: 1, message: 'Invalid e-mail/password'}
end

def get_request_param
  request.body.rewind  # in case someone already read it
  body = request.body.read
  l(body)
  JSON.parse body
end

def l(value)
  puts " ==> #{value}"
  value
end
