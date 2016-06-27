require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

TAXI_ID = 123

# CONTROLLER

get '/say' do
  '<h1>Hi!</h1>'
end

post "/authentication" do
  data = get_request_param

  response = {}

  email = data['email'] || ''
  password = data['password'] || ''

  if email == 'a@b.c' && password == '123456'
    response['token'] = 'TOKEN'
    response['taxi_id'] = TAXI_ID 
  else
    response['code'] = 1
    response['message'] = 'Invalid e-mail/password'
  end

  l(response.to_json)
end

put "/location" do
  data = get_request_param
	
  response = {}

  response.merge!(check_token(data))

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
  taxi_id = data['taxi_id'] || 0

  if token == 'TOKEN' && taxi_id == TAXI_ID
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
