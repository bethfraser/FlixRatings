require 'open-uri'
require 'json'

film1 = open('http://www.omdbapi.com/?t=jaws&r=json')



response_status = film1.status
response_body = JSON.parse(film1.read)

puts response_status
puts response_body
puts response_body["Title"]
puts response_body["imdbRating"]