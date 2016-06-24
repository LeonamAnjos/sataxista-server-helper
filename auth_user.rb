require 'rest-client'

puts
puts 'Should return success:'
puts RestClient.post 'http://0.0.0.0:4567/authentication', { email: 'a@b.c', password: '123456' }.to_json

puts
puts 'Should return error:'
puts RestClient.post 'http://0.0.0.0:4567/authentication', { }.to_json
puts RestClient.post 'http://0.0.0.0:4567/authentication', { email: '' }.to_json
puts RestClient.post 'http://0.0.0.0:4567/authentication', { email: 'a@b.c', password: '' }.to_json
