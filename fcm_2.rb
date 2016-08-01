require 'rest-client'

puts 'Sending taxi request - Gabriel Anjos'

puts RestClient.post 'https://fcm.googleapis.com/fcm/send',
	'{ 
      "data": {
			"request": { "id": 22, 
				"address": { "street": "Av. das Palmeira", 
				 "number": "2342", 
				 "neighborhood": "Jd. Paris III", 
				 "city": "Maringá", 
				 "state": "PR" }, 
				 "large_trunk": false, 
				 "payment_method": "master",
				 "accessible_cab": false,
				 "name": "Garibel Anjos",
				 "cellphone": "44 9922-6623" }  },
      "to": "e9NIieEo0UU:APA91bG-po5bQexrofuv4YDBjcUPleHkJGlecpKg05LaNI6coy5noyr2FXUPN4IBVvSxfC6BNN4rw0dY1QvM8M3kboUMeTKgVCOSUN9yDDPpL4yekn3ccjQm7zqMyzOZEKwkgrmyKGAg"
	}', 
	:content_type => "application/json", 
	:authorization => "key=AIzaSyBkp_qyZC6vASVR0CEVGnkWHt1xJYpQCsA"

