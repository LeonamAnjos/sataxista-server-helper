require 'rest_client'

puts
puts 'Should return success:'
puts RestClient.post 'http://0.0.0.0:4567/accept_request', { token: 'TOKEN', request_id: 132 }.to_json
puts RestClient.post 'http://0.0.0.0:4567/refuse_request', { token: 'TOKEN', request_id: 132 }.to_json
puts RestClient.post 'http://0.0.0.0:4567/finish_request', { token: 'TOKEN', request_id: 132 }.to_json


puts 'Should return error:'
puts RestClient.post 'http://0.0.0.0:4567/accept_request', { request_id: 132 }.to_json
puts RestClient.post 'http://0.0.0.0:4567/refuse_request', { token: '', request_id: 132 }.to_json
puts RestClient.post 'http://0.0.0.0:4567/finish_request', { token: 'KEN', request_id: 132 }.to_json


