require 'rest-client'

puts
puts 'Should return success:'
puts RestClient.put 'http://192.168.1.12:4567/location', { token: 'TOKEN', location: {latitud: 123, longitud: 321, time: 112233} }.to_json

puts
puts 'Should return error:'
puts RestClient.put 'http://0.0.0.0:4567/location', { location: {latitud: 123, longitud: 321, time: 112233} }.to_json
puts RestClient.put 'http://0.0.0.0:4567/location', { token: '', location: {latitud: 123, longitud: 321, time: 112233} }.to_json
puts RestClient.put 'http://0.0.0.0:4567/location', { token: 'OTHER', location: {latitud: 123, longitud: 321, time: 112233} }.to_json



