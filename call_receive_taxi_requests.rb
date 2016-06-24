require 'rest-client'

puts
puts 'Should return success:'
puts RestClient.post 'http://0.0.0.0:4567/receive_taxi_requests', { taxi_id: 1, enable: true }.to_json

puts
puts 'Should return error:'
puts RestClient.post 'http://0.0.0.0:4567/receive_taxi_requests', { }.to_json
puts RestClient.post 'http://0.0.0.0:4567/receive_taxi_requests', { taxi_id: 0 }.to_json
puts RestClient.post 'http://0.0.0.0:4567/receive_taxi_requests', { taxi_id: 1 }.to_json
