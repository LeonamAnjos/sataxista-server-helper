require 'rest-client'

puts 'Sending taxi request - Cauã França'

puts RestClient.post 'https://fcm.googleapis.com/fcm/send',
	'{ 
      "data": {
			"request": { "id": 23, 
				"address": { "street": "Av. João Pereira", 
				 "number": "3948", 
				 "neighborhood": "Jd. Paris II", 
				 "city": "Maringá", 
				 "latitude": -23,384688,
				 "longitude": -51,9609399,
				 "state": "PR" }, 
				 "large_trunk": true, 
				 "payment_method": "cash",
				 "accessible_cab": false,
				 "name": "Cauã França", 
				 "cellphone": "44 9954-6363",
				 "phone": "44 3322-1625" }  },
      "to": "e9NIieEo0UU:APA91bG-po5bQexrofuv4YDBjcUPleHkJGlecpKg05LaNI6coy5noyr2FXUPN4IBVvSxfC6BNN4rw0dY1QvM8M3kboUMeTKgVCOSUN9yDDPpL4yekn3ccjQm7zqMyzOZEKwkgrmyKGAg"
	}', 
	:content_type => "application/json", 
	:authorization => "key=AIzaSyBkp_qyZC6vASVR0CEVGnkWHt1xJYpQCsA"

