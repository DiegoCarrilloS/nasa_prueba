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
    puts response.read_body  
end


url_curiosity = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&"
url_opportunity = "https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&"
url_spirit = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&"
api_key = "DEMO_KEY"

request(url_curiosity, api_key)
#request(url_opportunity, api_key)
#request(url_spirit, api_key)