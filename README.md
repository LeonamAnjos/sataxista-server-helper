# SA Taxista Server Prototype

Simple Sinatra REST server used to help developing SA Taxista Mobile App (coming soon.. :-) )

## Instalation

Clone this repository, install dependencies and start Sinatra server:
```sh
$ git clone https://github.com/LeonamAnjos/sataxista-server-helper.git
$ cd sataxista-server-helper
$ ruby sataxista_server.rb
```

At mobile application, you can redirect rest calls to this server.
You can check the expected behavior (expected request and response). With the server up, open a new terminal and execute the route you want to check. Example checking "/receive_taxi_requests" route:
```sh
$ cd sataxista-server-helper
$ ruby call_receive_taxi_requests.rb
```
