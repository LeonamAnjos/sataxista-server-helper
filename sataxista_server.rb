require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

TAXI_ID = 123
VALID_EMAIL = 'a@b.com'
VALID_PASSWORD = '123456'
TOKEN = 'THE_TOKEN'

# CONTROLLER

get '/say/more' do
  '<h1>Hi!</h1>'
end

get "/api/v1/active_request" do
	l("active_request")

  content_type :json

  token = params['token']
  taxi_id = params['taxi_id']

  l("Taxi Id: #{taxi_id} - Token: #{token}")

  response = {
	  "request": { 
		  "id": 2,
		  "address": { 
			  "street": "Rua Teste", 
			  "number": "123", 
			  "complement": "Complemento teste",
			  "neighborhood": "Bairro teste",
			  "city": "cidade teste",
			  "state": "PR" },
		  "large_trunk": true,
		  "accessible_cab": false,
		  "payment_method": "cash",
		  "name": "Fulano",
		  "phone": "44 3322-6655",
	      "status": "going"}  }

  
  l(response.to_json)
end

post "/api/v1/authentication" do
  l("authentication")
	
  data = get_request_param

  response = {}

  email = data['email'] || ''
  password = data['password'] || ''

  if email == VALID_EMAIL && password == VALID_PASSWORD
    response['token'] = TOKEN
    response['taxi_id'] = TAXI_ID 
  else
    response['code'] = 1
    response['message'] = 'Invalid e-mail/password'
  end

  l(response.to_json)
end

put "/api/v1/car_status" do
	l("car_status")

	data = get_request_param
	response = {}
	response.merge!(check_token(data))
	l(response.to_json)
end

put "/api/v1/giveup_request" do
	l("giveup_request")

  data = get_request_param

  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

put "/api/v1/location" do
 	l("location")
 data = get_request_param
	
  response = {}

  response.merge!(check_token(data))

  l(response.to_json)
end

put "/api/v1/accept_request" do
	l("accept_request")

  data = get_request_param

  response = {}
  response.merge!(check_token(data))

  #response = {code: 2, message: 'Taxi inválido!'}


  l(response.to_json)
end

put "/api/v1/refuse_request" do
	l("refuse_request")
  data = get_request_param
 
  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

put "/api/v1/finish_request" do
	l("finish_request")
  data = get_request_param
 
  response = {}
  response.merge!(check_token(data))

  l(response.to_json)
end

private

def check_token(data)
  token = data['token'] || ''
  taxi_id = data['taxi_id'] || 0

  if token == TOKEN && taxi_id == TAXI_ID
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
  puts "#{Time.now} ==> #{value}"
  value
end
