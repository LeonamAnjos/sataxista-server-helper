require 'rest-client'

puts 'Sending taxi request to cellphone'

puts RestClient.post 'https://fcm.googleapis.com/fcm/send',
	'{ 
      "data": {
			"request": { "id": 1, 
				"address": { "street": "Rua Teste", 
				 "number": "123", 
				 "complement": "Complemento teste", 
				 "neighborhood": "Bairro teste", 
				 "city": "cidade teste", 
				 "state": "PR" }, 
				 "passengers": 1, 
				 "large_trunk": true, 
				 "name": "Fulano", 
				 "phone": "44 3322-6655" }  },
      "to": "e9NIieEo0UU:APA91bG-po5bQexrofuv4YDBjcUPleHkJGlecpKg05LaNI6coy5noyr2FXUPN4IBVvSxfC6BNN4rw0dY1QvM8M3kboUMeTKgVCOSUN9yDDPpL4yekn3ccjQm7zqMyzOZEKwkgrmyKGAg"
	}', 
	:content_type => "application/json", 
	:authorization => "key=AIzaSyBkp_qyZC6vASVR0CEVGnkWHt1xJYpQCsA"

