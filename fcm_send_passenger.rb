require 'rest-client'
require_relative 'fcm_keys'

puts 'Sending taxi request to cellphone'

puts RestClient.post 'https://fcm.googleapis.com/fcm/send',
	"{
    \"data\":
		{
			\"request\":
			{
				\"taxi_request\":
				{
					\"request_id\":123,
					\"taxi_cab\":
					{
						\"lat\":-23.41324,
						\"lng\":-51.9436612,
						\"driver\":\"Fulano de Tal\",
						\"plate\":\"AXV2332\",
						\"model\":\"Ferrari\",
						\"cellphone\":\"4499643636\"
					}
				}
			}
		 },
		\"to\": \"#{fcm_address}\"
	}",
	:content_type => "application/json",
	:authorization => "key=#{authorization_key}"



	#curl --header "Authorization: key=eebdNSJKAXcbGgeF9J7t6iWe0SwylG4TEd8miZYm" --header Content-Type:"application/json" https://fcm.googleapis.com/fcm/send -d "{\"registration_ids\":[\"d8uNuAs2adM:APA91bFwzn64F67LBEBu9nFWzYpjLz8dDK31Qs8Y3ZVYUf-BQH-ukbsATZccsCtJ3ZDXVlLEte59GTpHG6SYZEJDZhrQLFirbTR0PbJhyP4_cmYsxhunB3uPJ_Unti3u16YUsTIbyCdt\"]}"
