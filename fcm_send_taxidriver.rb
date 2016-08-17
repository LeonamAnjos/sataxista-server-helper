require 'rest-client'
require_relative 'fcm_keys'


puts 'Sending taxi request to cellphone'

puts RestClient.post 'https://fcm.googleapis.com/fcm/send',
	"{
      \"data\": {
			\"request\": { \"id\": 1,
				\"address\": { \"street\": \"Av. Mandacaru\",
				 \"number\": \"2332\",
				 \"complement\": \"Complemento teste\",
				 \"neighborhood\": \"BVila Santa Izabel\",
				 \"city\": \"Maringá\",
				 \"state\": \"PR\" },
				 \"passengers\": 1,
				 \"large_trunk\": true,
				 \"payment_method\": \"cash\",
				 \"accessible_cab\": false,
				 \"name\": \"Fulano\",
				 \"phone\": \"44 3322-6655\" }  },
      \"to\": \"#{fcm_address}\"
	}",
	:content_type => "application/json",
	:authorization => "key=#{authorization_key}"
