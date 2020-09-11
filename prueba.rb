require "uri"
require "net/http"
require 'json'


def request(url1, api_key)
    full_url = "#{url1}api_key=#{api_key}"
    url = URI(full_url)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    body = JSON.parse response.read_body
    return(body)
end
=begin
def buid_web_page(hash)
    hash.["photos":[{[0].each do |i|
        puts i["img_src"]
    end
end
=end


url_curiosity = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&"
url_opportunity = "https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&"
url_spirit = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&"
api_key = "9zeOm3k53oc9dW1ZUrFK1EqlYzc9sPWkqSBAaPr4"

r_curiosity = request(url_curiosity, api_key)
r_opportunity = request(url_opportunity, api_key)
r_spirit = request(url_spirit, api_key)

r_curiosity["photos"].each do |i|
    puts i["img_src"]
end
r_opportunity["photos"].each do |i|
    puts i["img_src"]
end
r_spirit["photos"].each do |i|
    puts i["img_src"]
end


#buid_web_page(r_curiosity)