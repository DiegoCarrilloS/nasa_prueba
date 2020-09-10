require "uri"
require "net/http"
require 'json'

url = URI("https://api.nasa.gov/planetary/apod?api_key=9zeOm3k53oc9dW1ZUrFK1EqlYzc9sPWkqSBAaPr4")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
body = JSON.parse response.read_body
body.each do |post|
    put post['title']
end
